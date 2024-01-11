<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_random"></a> [random](#requirement\_random) | 3.6.0 |
| <a name="requirement_vault"></a> [vault](#requirement\_vault) | 3.23.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_random"></a> [random](#provider\_random) | 3.6.0 |
| <a name="provider_vault"></a> [vault](#provider\_vault) | 3.23.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [random_password.userpass_namespace_admin_password](https://registry.terraform.io/providers/hashicorp/random/3.6.0/docs/resources/password) | resource |
| [vault_auth_backend.userpass](https://registry.terraform.io/providers/hashicorp/vault/3.23.0/docs/resources/auth_backend) | resource |
| [vault_generic_endpoint.userpass_namespace_admin](https://registry.terraform.io/providers/hashicorp/vault/3.23.0/docs/resources/generic_endpoint) | resource |
| [vault_jwt_auth_backend.tfc_jwt](https://registry.terraform.io/providers/hashicorp/vault/3.23.0/docs/resources/jwt_auth_backend) | resource |
| [vault_jwt_auth_backend_role.tfc_role](https://registry.terraform.io/providers/hashicorp/vault/3.23.0/docs/resources/jwt_auth_backend_role) | resource |
| [vault_kv_secret_v2.tenant](https://registry.terraform.io/providers/hashicorp/vault/3.23.0/docs/resources/kv_secret_v2) | resource |
| [vault_mount.tenant](https://registry.terraform.io/providers/hashicorp/vault/3.23.0/docs/resources/mount) | resource |
| [vault_namespace.tenant](https://registry.terraform.io/providers/hashicorp/vault/3.23.0/docs/resources/namespace) | resource |
| [vault_policy.admin_policy](https://registry.terraform.io/providers/hashicorp/vault/3.23.0/docs/resources/policy) | resource |
| [vault_policy.tfc_policy](https://registry.terraform.io/providers/hashicorp/vault/3.23.0/docs/resources/policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_TFC_PROJECT_NAME"></a> [TFC\_PROJECT\_NAME](#input\_TFC\_PROJECT\_NAME) | Name of the TFC Project that is used for creating the Vault namespace | `string` | `null` | no |
| <a name="input_TFC_WORKSPACE_NAME"></a> [TFC\_WORKSPACE\_NAME](#input\_TFC\_WORKSPACE\_NAME) | Name of the TFC workspace that is used for naming the Vault namespace | `string` | `null` | no |
| <a name="input_TFC_WORKSPACE_SLUG"></a> [TFC\_WORKSPACE\_SLUG](#input\_TFC\_WORKSPACE\_SLUG) | The full slug of the configuration used in this run. | `string` | `null` | no |
| <a name="input_hpl_tfc_organisation_name"></a> [hpl\_tfc\_organisation\_name](#input\_hpl\_tfc\_organisation\_name) | The TFC Organisation name | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_namespace_admin_password"></a> [namespace\_admin\_password](#output\_namespace\_admin\_password) | The password for the namespace-admin account |
<!-- END_TF_DOCS -->