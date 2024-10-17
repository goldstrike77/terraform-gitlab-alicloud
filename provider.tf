terraform {
  required_providers {
    alicloud = {
      source  = "hashicorp/alicloud"
      version = "1.231.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "2.53.1"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.6.3"
    }
  }
  backend "http" {
  }
}

provider "alicloud" {
  region = "cn-shanghai"
}
