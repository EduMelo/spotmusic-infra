variable "project_name" {
  description = "Grupo 09"
  type        = string
}

variable "region" {
  description = "Google Cloud region"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "Google Cloud zone"
  type        = string
  default     = "us-central-a"
}

variable "password" {
  description = "Google Database password"
  type        = string
  default     = "12345678"
}