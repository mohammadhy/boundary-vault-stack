# ssh private key conf


variable "hosts_info" {
  type = list(object({
    name         = string,
    ip           = string,
    ssh_user     = string,
    ssh_port     = string,
    ssh_key_path = string,
    ssh_key_name = string
  }))
  description = "The required information for your hosts."
}

variable "clients" {
  type        = map(string)
  description = "users with list, session auth and authorization grants"
}

variable "admins" {
  type        = map(string)
  description = "users with administrative (crud) grants within DVH project"
}

variable "readonly_users" {
  type        = map(string)
  description = "users who only have list access to boundary resources"
}

variable "main_server_ips" {
  type        = set(string)
  description = "main servers (e.g : stage and prod) ips"
}
variable "main_server_names" {
  type        = set(string)
  description = "main server names"
}

# provider variables
variable "boundary_address" {
  type        = string
  description = "address of boundary api and controller for first time auth"
  sensitive   = true
}

variable "auth_method_id" {
  type        = string
  sensitive   = true
  description = "auth method id to use for api authentication"
}

variable "login_name" {
  type        = string
  sensitive   = true
  description = "login name to use for authentication"
}

variable "login_password" {
  type        = string
  sensitive   = true
  description = "password to use for authentication"
}

# credential stores
variable "main_cred_store_name" {
  type        = string
  sensitive   = true
  description = "main servers credential store name"
}

## start of SSH_INJECTION
variable "SSH_INJECTION" {
  type = bool
  default = false
  description = "whehter to use ssh credential library"
}

variable "test_ssh_port" {
  type = string
  description = "ssh port for the test target"
}
variable "vault_address" {
  type        = string
  sensitive   = true
  description = "address to vault server"
}

variable "vault_cred_store_token" {
  type        = string
  sensitive   = true
  default = "hvs.test"
  description = "vault token for credential store"
}

variable "vault_sign_path" {
  type = string
  description = "Path to the Vault key to sign boundary client"
}
variable "vault_username" {
  type = string
}

## end of SSH_INJECTION


# permissions and roles

## all grants

variable "all_list" {
  type        = string
  description = "the read list permission for all resources"
}

variable "all_read" {
  type        = string
  description = "the read list permission for all resources"
}

variable "all_actions" {
  type        = string
  description = "all permissions for all of available resources"
}

## targets
variable "target_read_list" {
  type        = string
  description = "the read and list permission for targets"
}

variable "target_list" {
  type        = string
  description = "the list permission for targets"
}

variable "target_authorize_session" {
  type        = string
  description = "the permission to get authorized to targets"
}

variable "target_crud" {
  type        = string
  description = "craete,read,update,delete permission for targets"
}

variable "target_add_creds" {
  type        = string
  description = "permission to add-credential-sources to the targets"
}

## auth method
variable "auth_method_list" {
  type        = string
  description = "list auth-method entities permission"
}
variable "auth_method_authenticate" {
  type        = string
  description = "initial authenticate permission to boundary"
}

## group and hosts and users
variable "group_list" {
  type        = string
  description = "list permission for groups"
}

variable "host_list" {
  type        = string
  description = "list permission for hosts"
}

variable "host_catalog_list" {
  type        = string
  description = "list permission for host_catalogs"
}

variable "host_sets_list" {
  type        = string
  description = "list permission for host_sets"
}

variable "host_sets_list_read" {
  type        = string
  description = "list and read permission for host_sets"
}

variable "user_list" {
  type        = string
  description = "list permission for users"
}

## roles and sessions
variable "role_list" {
  type        = string
  description = "list permission for roles"
}
variable "session_read_list" {
  type        = string
  description = "self read and list permissions for sessions"
}
variable "session_recording_list" {
  type        = string
  description = "self read and list permissions for sessions-recording"
}

variable "session_recording_read_list" {
  type        = string
  description = "read and list permissions for sessions-recording"
}

variable "test_server_name" {
  type        = string
  description = "The ssh testing server name!"
}
