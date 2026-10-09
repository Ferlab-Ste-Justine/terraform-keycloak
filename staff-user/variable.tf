variable "realm_id" {
  description = "ID of the Keycloak realm the user will be created in."
  type        = string
}

variable "username" {
  description = "Username for the Keycloak user."
  type        = string
}

variable "email" {
  description = "Email address for the Keycloak user."
  type        = string
}

variable "first_name" {
  description = "First name for the Keycloak user."
  type        = string
}

variable "last_name" {
  description = "Last name for the Keycloak user."
  type        = string
}

variable "password" {
  description = "Initial password for the Keycloak user."
  type        = string
  sensitive   = true
}

variable "role_ids" {
  description = "IDs of the Keycloak roles to assign to the user."
  type        = list(string)
  default     = []
}

variable "group_ids" {
  description = "IDs of Keycloak groups to assign to the user."
  type        = list(string)
  default     = []
}
