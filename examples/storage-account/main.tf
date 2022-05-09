module "storage_account_soundsunite" {
    source = "../../azure-storage-account"
    name = "devtestblobs"
    resource_group_name = "1-09bc98b6-playground-sandbox"
    location = "Central US"
    replication_type        = "LRS"
    enable_large_file_share = true
    account_tier = "Standard"
    shared_access_key_enabled = true
tags   = {
    "ApplicationName" = "SU-test"
}

}