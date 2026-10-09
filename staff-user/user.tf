resource "terraform_data" "user_password" {
  input = nonsensitive(sha256(var.password))
}

resource "keycloak_user" "user" {
  realm_id = var.realm_id
  username = var.username
  email    = var.email
  enabled  = true

  first_name = var.first_name
  last_name  = var.last_name

  email_verified = true

  initial_password {
    value     = var.password
    temporary = false
  }

  lifecycle {
    replace_triggered_by = [terraform_data.user_password]
  }
}

resource "keycloak_user_roles" "user" {
  realm_id = var.realm_id
  user_id  = keycloak_user.user.id

  role_ids = var.role_ids

  exhaustive = true
}

resource "keycloak_user_groups" "user" {
  realm_id   = var.realm_id
  user_id    = keycloak_user.user.id
  group_ids  = var.group_ids
  exhaustive = true
}
