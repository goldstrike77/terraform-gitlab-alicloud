module "alicloud_resource_manager_resource_group" {
  source             = "git::https://gitea.home.local/suzhetao/terraform-module-alicloud.git//resource-manager/resource-group?ref=v0.1"
  alicloud_resources = var.alicloud_resources
}

module "alicloud_vpc" {
  source             = "git::https://gitea.home.local/suzhetao/terraform-module-alicloud.git//vpc?ref=v0.1"
  tags               = var.tags
  alicloud_resources = var.alicloud_resources
  depends_on         = [module.alicloud_resource_manager_resource_group]
}

module "alicloud_vpc_ipv4_cidr_block" {
  source             = "git::https://gitea.home.local/suzhetao/terraform-module-alicloud.git//vpc-ipv4-cidr-block?ref=v0.1"
  alicloud_resources = var.alicloud_resources
  depends_on         = [module.alicloud_vpc]
}

module "alicloud_vpc_peer_connection" {
  source             = "git::https://gitea.home.local/suzhetao/terraform-module-alicloud.git//vpc-peer-connection?ref=v0.1"
  tags               = var.tags
  alicloud_resources = var.alicloud_resources
  depends_on         = [module.alicloud_vpc]
}

module "alicloud_vswitch" {
  source             = "git::https://gitea.home.local/suzhetao/terraform-module-alicloud.git//vswitch?ref=v0.1"
  tags               = var.tags
  alicloud_resources = var.alicloud_resources
  depends_on         = [module.alicloud_vpc_peer_connection]
}

module "alicloud_route_table" {
  source             = "git::https://gitea.home.local/suzhetao/terraform-module-alicloud.git//route-table?ref=v0.1"
  tags               = var.tags
  alicloud_resources = var.alicloud_resources
  depends_on         = [module.alicloud_vswitch]
}

module "alicloud_security_group" {
  source             = "git::https://gitea.home.local/suzhetao/terraform-module-alicloud.git//security-group?ref=v0.1"
  tags               = var.tags
  alicloud_resources = var.alicloud_resources
  depends_on         = [module.alicloud_vpc]
}
