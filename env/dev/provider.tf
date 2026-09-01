terraform {
    required_providers {
        azurerm = {
            source = "hashicorp/azurerm"
            version = "4.81.0"
        }
    }

    backend "azurerm" {
        resource_group_name = "rg-bknd"
        storage_account_name = "stgbknd"
        container_name = "bkndcrn"
        key = "dev.tfstate"
    }
}

provider "azurerm" {
    features {}
    subscription_id = "6a524391-ccd6-4805-af61-46c905f304e1"
}