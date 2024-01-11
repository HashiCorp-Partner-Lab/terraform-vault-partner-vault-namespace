# Create a namespace in Vault that matches the TFC Workspace name

resource "vault_namespace" "tenant" {
  path = var.TFC_WORKSPACE_NAME
  custom_metadata = {
    "Project" : var.TFC_PROJECT_NAME
  }
}

# Enable a KV v2 Secrets Engine and populate it with an example secret

resource "vault_mount" "tenant" {
  namespace = vault_namespace.tenant.path
  path      = "secrets"
  type      = "kv"
  options = {
    version = "2"
  }
}

resource "vault_kv_secret_v2" "tenant" {
  namespace = vault_namespace.tenant.path
  mount     = vault_mount.tenant.path
  name      = "my-first-secret"
  data_json = jsonencode(
    {
      zip = "zap",
      foo = "bar"
    }
  )
  custom_metadata {
    max_versions = 5
    data = {
      foo = "vault@example.com",
      bar = "12345"
    }
  }
}

# Create polices to be used with TFC and for Administration

resource "vault_policy" "tfc_policy" {
  namespace = vault_namespace.tenant.path
  name      = "tfc-policy"

  policy = <<EOT
# Allow read access to KV Secrets Engine
path "secrets/*" {
  capabilities = [ "read" ]
}
EOT
}

resource "vault_policy" "admin_policy" {
  namespace = vault_namespace.tenant.path
  name      = "admin-policy"

  policy = <<EOT
# Allow full admin access to namespace
path "*" {
	capabilities = ["sudo","read","create","update","delete","list","patch"]
}
EOT
}

# Enable the JWT auth method to use with TFC

resource "vault_jwt_auth_backend" "tfc_jwt" {
  namespace          = vault_namespace.tenant.path
  path               = "jwt"
  type               = "jwt"
  oidc_discovery_url = "https://app.terraform.io"
  bound_issuer       = "https://app.terraform.io"
}

resource "vault_jwt_auth_backend_role" "tfc_role" {
  namespace      = vault_namespace.tenant.path
  backend        = vault_jwt_auth_backend.tfc_jwt.path
  role_name      = "tfc-role"
  token_policies = [vault_policy.tfc_policy.name]

  bound_audiences   = ["vault.workload.identity"]
  bound_claims_type = "glob"
  bound_claims = {
    sub = "organization:${split("/", var.TFC_WORKSPACE_SLUG)[0]}:project:${var.TFC_PROJECT_NAME}:workspace:*:run_phase:*"
  }

  user_claim = "terraform_full_workspace"
  role_type  = "jwt"
  token_ttl  = 1200
}

# Enable the Userpass auth method and create a user for namespace administration

resource "vault_auth_backend" "userpass" {
  namespace = vault_namespace.tenant.path
  type      = "userpass"
}

resource "random_password" "userpass_namespace_admin_password" {
  length = 32
}

resource "vault_generic_endpoint" "userpass_namespace_admin" {
  namespace            = vault_namespace.tenant.path
  depends_on           = [vault_auth_backend.userpass]
  path                 = "auth/userpass/users/namespace-admin"
  ignore_absent_fields = true

  data_json = <<EOT
{
  "policies": ["${vault_policy.admin_policy.name}"],
  "password": "${random_password.userpass_namespace_admin_password.result}"
}
EOT
}
