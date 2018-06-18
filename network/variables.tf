variable "tenant_id" {}
variable "subscription_id" {}
variable "client_id" {}
variable "client_secret" {}

# Example:
# location = "${lookup(var.environments[terraform.workspace], "location")}"

variable "environments" {
  type = "map"

  default = {
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
