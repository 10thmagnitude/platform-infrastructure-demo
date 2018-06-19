variable "tenant_id" {}
variable "subscription_id" {}
variable "client_id" {}
variable "client_secret" {}

# Example:
# location = "${lookup(var.config[var.workspace], "location")}"
variable "workspace" {
  default = "default"
}

variable "config" {
  type = "map"

  default = {
    default = {
      location         = ""
      environment      = ""
      environment_type = ""
      service_line     = ""
    }

    A1D = {
      location         = "centralus"
      environment      = "Development"
      environment_type = "dv"
      service_line     = "glo"
    }

    A1Q = {
      location         = "centralus"
      environment      = "QA"
      environment_type = "qa"
      service_line     = "glo"
    }

    A1P = {
      location         = "centralus"
      environment      = "Production"
      environment_type = "pr"
      service_line     = "glo"
    }
  }
}
