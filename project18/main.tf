terraform {
  required_version = ">= 1.5.0"
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

variable "environment" {
  type    = string
  default = "production"
}

resource "local_file" "infra_state" {
  filename = "${path.module}/deployed-infra.json"
  content = jsonencode({
    project     = "Capstone_Project_18_GitOps"
    owner       = "Suryaansh Dev"
    environment = var.environment
    region      = "ap-south-1"
    managed_by  = "Terraform + GitHub Actions"
  })
}

output "deployment_summary" {
  value = "GitOps Infrastructure applied for ${var.environment} in ap-south-1"
}
