terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.0"
    }
  }
}

# Stand-in for a real network resource: the 3560-CX has no Terraform
# provider, so this demonstrates declarative state and drift detection
# using a local file instead.
resource "local_file" "vlans" {
  filename = "${path.module}/sw1-vlans.txt"
  content  = "vlan 40 IOT\nvlan 50 PRINTERS\n"
}
