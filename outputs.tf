output "namespace_admin_password" {
  value       = random_password.userpass_namespace_admin_password.result
  description = "The password for the namespace-admin account"
  sensitive   = true
}