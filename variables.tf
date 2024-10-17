variable "tags" {
  default = {
    location    = "eastasia"
    environment = "prd"
    customer    = "Learn"
    owner       = "Somebody"
    email       = "somebody@mail.com"
    title       = "Engineer"
    department  = "IS"
  }
}

variable "alicloud_resources" {
  default = [
    {
      resource_manager_resource_group = {
        display_name = "rg-p-app-toolchain-002"
      }
      db = [
        {
          instance = [
            {
              name     = "m-p-app-toolchain-001"
              account  = []
              database = []
            }
          ]
          vpc            = "vpc-p-network-toolchain-cn-shanghai-001"
          vswitch        = ["vsw-p-network-toolchain-ecs-cn-shanghai-001"]
          security_group = ["sg-p-toolchain-kvstore-cn-shanghai-001"]
        }
      ]
    }
  ]
}
