variable "networks" {
  default = {
    "dev_vnet" = {
      address_space = ["10.0.0.0/9"]
      subnets = {
        "subnet_01" = {
          address_prefix    = ["10.1.0.0/16"],
          enable_netgateway = true
        },

        # "web"= {
        # address_prefix= ["10.2.0.0/16"],
        # enable_netgateway = true
        # },
        # "data"= {
        # address_prefix = ["10.3.0.0/16"],
        # enable_netgateway = true
        # },
        # "GatewaySubnet"= {
        # address_prefix = ["10.4.0.0/16"],
        # enable_netgateway = true
        # }
      }
    }
  }
  description = "(mandatory) network section"
}

locals {

  # for loop for values
  print_only_values = [
    for v in var.networks: v
  ]

  # for loop for keys
  print_only_keys = [
    for k, v in var.networks: k
  ]

  # Nested For Loop for nested keys
  print_nested_keys = [
    for k, v in var.networks: [
      for k, v in v: k
    ]
  ]

  # Nested for loop for nested values
    print_nested_values = [
    for k, v in var.networks: [
      for k, v in v : v
    ]
  ]
}

output "print_only_values" {
  value = local.print_only_values
}

output "print_only_keys" {
  value = local.print_only_keys
}

output "print_nested_keys" {
  value = local.print_nested_keys
}

output "print_nested_values" {
  value = local.print_nested_values
}


