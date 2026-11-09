resource "cloudflare_d1_database" "db" {
  account_id = var.account_id
  name       = var.d1_database_name
}

resource "cloudflare_workers_script" "worker" {
  account_id  = var.account_id
  script_name = var.worker_name
  content     = file("${path.module}/worker.js")
  main_module = "worker.js"

  bindings = [
    {
      name        = "DB"
      type        = "d1"
      database_id = cloudflare_d1_database.db.id
    }
  ]
}

resource "cloudflare_workers_script_subdomain" "worker_subdomain" {
  account_id  = var.account_id
  script_name = cloudflare_workers_script.worker.script_name
  enabled     = true
}

output "worker_url" {
  description = "URL where the worker will be reachable once the account's workers.dev subdomain is enabled."
  value       = "https://${var.worker_name}.<your-subdomain>.workers.dev"
}

output "d1_database_id" {
  value = cloudflare_d1_database.db.id
}
