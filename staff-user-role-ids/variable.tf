variable "realm_name" {
  description = "Name of the Keycloak realm the user is to have access to."
  type        = string
}

variable "master_realm_user" {
  description = "Set to true if user is in master realm."
  type        = bool
  default     = true
}

variable "management_roles" {
  description = "Names of realm management roles to assign to the user."
  type        = list(string)
}

variable "account_roles" {
  description = "Names of account roles to assign to the user. Should only be set if the realm is the user's own"
  type        = list(string)
  default     = []
}

resource "terraform_data"  "validation" {
  lifecycle {
    precondition {
      condition     = var.master_realm_user || var.realm_name != "master"
      error_message = "Only master realm user can have permission on master realm"
    }
  }
}