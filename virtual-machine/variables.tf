variable "subscription_id" {
  description = "The subscription id used to create resources"
}

variable "name_prefix" {
  description = "The prefix of vm name."
  default     = "demo"
}

variable "vm_count" {
  description = "The count of resources will be created."
  type        = number
  default     = 1
}

variable "instance_size" {
  description = "The instance vm size"
  # default     = "Standard_D2s_v3" #2c8g
  # default = "Standard_D4s_v3" #4c16g
  # default = "Standard_D8s_v3" #8c32g
  default = "Standard_D16ads_v5" #16c64g
}

variable "location" {
  description = "The location where the resources will be created."
  default     = "eastasia"
}

variable "resource_group_name" {
  description = "The name of the resource group where the resources will be created."
  default     = "example-resource-group"
}

variable "admin_username" {
  description = "The username for the virtual machine's administrator account."
}

variable "admin_password" {
  description = "The password for the virtual machine's administrator account."
}

variable "host_names" {
  type    = list(string)
  default = ["master", "member1", "member2", "member3", "member4"]
}

variable "image_publisher" {
  description = "The image publisher used to create vm."
  default     = "canonical"
}

variable "image_offer" {
  description = "The image offer used to create vm."
  default     = "0001-com-ubuntu-server-focal"
}

variable "image_sku" {
  description = "The image sku used to create vm"
  default     = "20_04-lts-gen2"
}
