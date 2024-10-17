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
              name = "m-p-app-toolchain-001"
              account = [
                { name = "super", password = "Passw0rd", type = "Super", privilege = "ReadWrite", db_names = ["d_test"] },
                { name = "user", password = "Passw0rd", privilege = "ReadOnly", db_names = ["d_test"] }
              ]
              database = [
                {
                  name          = "d_test"
                  character_set = "utf8mb4"
                }
              ]
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
