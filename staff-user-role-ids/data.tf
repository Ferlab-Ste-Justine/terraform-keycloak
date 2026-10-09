locals {
  realm_name = var.master_realm_user ? "master" : var.realm_name
  realm_management_client_id = var.master_realm_user ? "${var.realm_name}-realm" : "realm-management"
}

data "keycloak_realm" "target" {
  realm = local.realm_name
}

data "keycloak_openid_client" "realm_management" {
  realm_id  = data.keycloak_realm.target.id
  client_id = local.realm_management_client_id
}

data "keycloak_openid_client" "account" {
  realm_id  = data.keycloak_realm.target.id
  client_id = "account"
}

data "keycloak_role" "realm_management" {
  for_each = toset(var.management_roles)

  realm_id  = data.keycloak_realm.target.id
  client_id = data.keycloak_openid_client.realm_management.id
  name      = each.value
}

data "keycloak_role" "account" {
  for_each = toset(var.account_roles)

  realm_id  = data.keycloak_realm.target.id
  client_id = data.keycloak_openid_client.account.id
  name      = each.value
}