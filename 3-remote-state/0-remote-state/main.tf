module "remote-state-storage-account" {
  source   = "./modules/storage-container"
  prefix   = "tomdev"
  location = "West Europe"
}

output "resource_group_name" {
  value = "${module.remote-state-storage-account.resource_group_name}"
}

output "storage_account_access_key" {
  value = "${module.remote-state-storage-account.storage_account_access_key}"
}

output "storage_account_name" {
  value = "${module.remote-state-storage-account.storage_account_name}"
}

output "storage_container_name" {
  value = "${module.remote-state-storage-account.storage_container_name}"
}
