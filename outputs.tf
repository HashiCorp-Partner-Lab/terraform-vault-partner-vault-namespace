output "namespace_admin_username" {
  value       = "namespace-admin"
  description = "The username for the namespace-admin account"
}

output "namespace_admin_password" {
  value       = nonsensitive(random_password.userpass_namespace_admin_password.result)
  description = "The password for the namespace-admin account"
}

output "login_url" {
    value = "${var.vault_public_endpoint_url}/ui/vault/dashboard?namespace=${replace(trimsuffix(vault_namespace.tenant.id, "/"), "/", "%2F")}&with=userpass"
    description = "The login URL for the Vault namespace"
}