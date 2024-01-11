variable "hpl_tfc_organisation_name" {
  type        = string
  description = "The TFC Organisation name"
  default     = null
}

variable "TFC_WORKSPACE_NAME" {
  type        = string
  description = "Name of the TFC workspace that is used for naming the Vault namespace"
  default     = null
}

variable "TFC_WORKSPACE_SLUG" {
  type        = string
  description = "The full slug of the configuration used in this run."
  default     = null
}

variable "TFC_PROJECT_NAME" {
  type        = string
  description = "Name of the TFC Project that is used for creating the Vault namespace"
  default     = null
}
