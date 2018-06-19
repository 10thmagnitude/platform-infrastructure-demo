variable "tenant_id" {}
variable "subscription_id" {}
variable "client_id" {}
variable "client_secret" {}

# Example:
# location = "${lookup(var.config[var.workspace], "location")}"
variable "workspace" {
  default = "A1D"
}

variable "config" {
  type = "map"

  default = {
    default = {
      location    = ""
      environment = ""
    }

    A1D = {
      location    = "centralus"
      environment = "Development"
    }

    A1Q = {
      location    = "centralus"
      environment = "QA"
    }

    A1P = {
      location    = "centralus"
      environment = "Production"
    }
  }
}
