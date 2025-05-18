#!/bin/bash
# Set variables for easier command execution
RESOURCE_GROUP_NAME="devops2-group5-storage-rg"
STORAGE_ACCOUNT_NAME="devops2group5tfstate"
CONTAINER_NAME="devops2-group5-tfstate-container"
LOCATION="japanwest" # Or your preferred Azure region

# Create resource group
az group create --name $RESOURCE_GROUP_NAME --location $LOCATION

# Create storage account
az storage account create \
  --name $STORAGE_ACCOUNT_NAME \
  --resource-group $RESOURCE_GROUP_NAME \
  --location $LOCATION \
  --sku Standard_LRS \
  --kind StorageV2

# Create storage container
az storage container create \
  --name $CONTAINER_NAME \
  --account-name $STORAGE_ACCOUNT_NAME