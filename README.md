# Azure Storage Account Terraform Module

Terraform Module to create an Azure storage account with a set of containers (and access level), set of file shares (and quota), tables, queues, Network policies and Blob lifecycle management.

## Module Usage

```terraform
# Azure Provider configuration

module "storage_account_soundsunite" {
    source = "../../azure-storage-account"
    name = "devtestblobs"
    resource_group_name = "1-09bc98b6-xxxxxx"
    location = "Central US"
    replication_type        = "LRS"
    enable_large_file_share = true
    account_tier = "Standard"
    shared_access_key_enabled = true
    tags   = {
        "ApplicationName" = "SU-test"
    }

}
```

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.1.0 |
| azurerm | >= 3.1.0 |

## Providers

| Name | Version |
|------|---------|
| azurerm | >= 3.1.0 |

## Inputs

Name | Description | Type | Default
---- | ----------- | ---- | -------
`resource_group_name`|The name of the resource group in which resources are created|string|`""`
`location`|The location of the resource group in which resources are created|string| `""`
`account_kind`|General-purpose v2 accounts: Basic storage account type for blobs, files, queues, and tables.|string|`"StorageV2"`
`skuname`|The SKUs supported by Microsoft Azure Storage. Valid options are Premium_LRS, Premium_ZRS, Standard_GRS, Standard_GZRS, Standard_LRS, Standard_RAGRS, Standard_RAGZRS, Standard_ZRS|string|`Standard_RAGRS`
`access_tier`|Defines the access tier for BlobStorage and StorageV2 accounts. Valid options are Hot and Cool.|string|`"Hot"`
`min_tls_version`|The minimum supported TLS version for the storage account. Possible values are `TLS1_0`, `TLS1_1`, and `TLS1_2` |string|`"TLS1_2"`
`blob_soft_delete_retention_days`|Specifies the number of days that the blob should be retained, between `1` and `365` days.|number|`7`
`container_soft_delete_retention_days`|Specifies the number of days that the blob should be retained, between `1` and `365` days.|number|`7`
`enable_versioning`|Is versioning enabled?|string|`false`
`last_access_time_enabled`|Is the last access time based tracking enabled?|string|`false`
`change_feed_enabled`|Is the blob service properties for change feed events enabled?|string|`false`
`enable_advanced_threat_protection`|Controls Advance threat protection plan for Storage account!string|`false`
`managed_identity_type`|The type of Managed Identity which should be assigned to the Azure Storage. Possible values are `SystemAssigned`, `UserAssigned` and `SystemAssigned, UserAssigned`|string|`null`
`managed_identity_ids`|A list of User Managed Identity ID's which should be assigned to the Azure Storage.|string|`null`
`network_rules`|Configure Azure storage firewalls and virtual networks|list|`null`
`containers_list`| List of container|list|`[]`
`file_shares`|List of SMB file shares|list|`[]`
`queues`|List of storages queues|list|`[]`
`tables`|List of storage tables|list|`[]`
`lifecycles`|Configure Azure Storage firewalls and virtual networks|list|`{}`
`Tags`|A map of tags to add to all resources|map|`{}`

### `Container` objects (must have keys)

Name | Description | Type | Default
---- | ----------- | ---- | -------
`name` | Name of the container | string | `""`
`access_type` | The Access Level configured for the Container. Possible values are `blob`, `container` or `private`.|string|`"private"`

### `SMB file Shares` objects (must have keys)

Name | Description | Type | Default
---- | ----------- | ---- | -------
`name` | Name of the SMB file share | string | `""`
`quota` | The required size in GB. Defaults to `5120`|string|`""`


### `lifecycles` objects (must have keys)

Name | Description | Type | Default
---- | ----------- | ---- | -------
`prefix_match`|An array of strings for prefixes to be matched|set(string)|`[]`
`tier_to_cool_after_days`|The age in days after last modification to tier blobs to cool storage. Supports blob currently at `Hot` tier. Must be at least `0`.|number|`0`
`tier_to_archive_after_days`|The age in days after last modification to tier blobs to archive storage. Supports blob currently at `Hot` or `Cool` tier. Must be at least `0`.|number|`0`
`delete_after_days`|The age in days after last modification to delete the blob. Must be at least 0.|number|`0`
`snapshot_delete_after_days`|The age in days after create to delete the snapshot. Must be at least 0.|number|`0`

## Outputs

Name | Description
---- | -----------
`resource_group_name`|The name of the resource group in which resources are created
`resource_group_id`|The id of the resource group in which resources are created
`resource_group_location`|The location of the resource group in which resources are created
`storage_account_id`|The ID of the storage account
`sorage_account_name`|The name of the storage account
`storage_account_primary_location`|The primary location of the storage account
`storage_account_primary_blob_endpoint`|The endpoint URL for blob storage in the primary location
`storage_account_primary_web_endpoint`|The endpoint URL for web storage in the primary location
`storage_account_primary_web_host`|The hostname with port if applicable for web storage in the primary location
`storage_primary_connection_string`|The primary connection string for the storage account
`storage_primary_access_key`|The primary access key for the storage account
`storage_secondary_access_key`|The secondary access key for the storage account
`containers`|The list of containers
`file_shares`|The list of SMB file shares
`tables`|The list of storage tables
`queues`|The list of storage queues

## Authors

Originally created by [xxxxxxx](mailto:xxxxx.com)

## Other resources

* [Azure Storage documentation](https://docs.microsoft.com/en-us/azure/storage/)
* [Terraform AzureRM Provider Documentation](https://www.terraform.io/docs/providers/azurerm/index.html)
