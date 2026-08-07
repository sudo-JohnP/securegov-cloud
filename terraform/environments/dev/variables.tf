variable "aws_region" {
  description = "AWS region where SecureGov Cloud resources will be deployed."

  type = string
}

variable "environment" {
  description = "Deployment environment."

  type = string

  validation {
    condition = contains(
      ["dev", "stage", "prod"],
      var.environment
    )

    error_message = "Environment must be dev, stage, or prod."
  }
}

variable "project_name" {
  description = "Name of project used for resource tagging."

  type = string
}