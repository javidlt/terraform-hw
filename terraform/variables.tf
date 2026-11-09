variable "account_id" {
  description = "Cloudflare account ID where the resources will be created."
  type        = string
}

variable "api_token" {
  description = "Cloudflare API token with Workers Scripts, D1 and Workers Subdomain permissions."
  type        = string
  sensitive   = true
}

variable "worker_name" {
  description = "Name of the Cloudflare Worker script."
  type        = string
  default     = "practica11-worker"
}

variable "d1_database_name" {
  description = "Name of the Cloudflare D1 database."
  type        = string
  default     = "practica11-db"
}
