output "role_ids" {
  description = "IDs of the resolved roles."
  value = concat(
    [for role in data.keycloak_role.realm_management : role.id],
    [for role in data.keycloak_role.account : role.id],
  )
}