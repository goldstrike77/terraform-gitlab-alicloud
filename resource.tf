module "alicloud_resource_manager_resource_group" {
  source             = "git::https://gitea.home.local/suzhetao/terraform-module-alicloud.git//resource-manager/resource-group?ref=v0.1"
  alicloud_resources = var.alicloud_resources
}

module "alicloud_db_instance" {
  source             = "git::https://gitea.home.local/suzhetao/terraform-module-alicloud.git//db-instance?ref=v0.1"
  tags               = var.tags
  alicloud_resources = var.alicloud_resources
  depends_on         = [module.alicloud_resource_manager_resource_group]
}
