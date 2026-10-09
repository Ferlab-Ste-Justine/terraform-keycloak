output "user_id" {
  description = "ID of the created Keycloak user."
  value       = keycloak_user.user.id
}
