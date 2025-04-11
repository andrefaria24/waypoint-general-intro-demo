variable "HCP_PROJECT_ID" {
  type      = string
  sensitive = true
}

variable "HCP_HVN_ID" {
  type      = string
  sensitive = true
}

variable "HCP_CLOUD_PROVIDER" {
  type    = string
  default = "aws"
}

variable "HCP_HVN_REGION" {
  type    = string
  default = "us-west-2"
  validation {
    condition     = contains(["us-west-2"], var.HCP_HVN_REGION)
    error_message = "The region must be us-west-2."
  }
}

variable "HCP_HVN_CIDR" {
  type = string
}

variable "TFE_TOKEN" {
  type = string
  sensitive = true
}

variable "TFE_ORG_NAME" {
  type = string
}

variable "GH_TOKEN" {
  type = string
  sensitive = true
}

variable "GH_ORG_NAME" {
  type = string
}

variable "GH_STATIC_APP_REPO" {
  type = string
}