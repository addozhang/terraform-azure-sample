## Prerequisites

Before you begin, make sure you have the following:

- An Azure account
- [Terraform CLI](https://developer.hashicorp.com/terraform/downloads)
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)

## How to use

Clone the code to your local machine.

```shell
git clone https://github.com/addozhang/terraform-azure-sample.git
```

## Authentication

Execute the following command to start authentication. Before authentication, you need to access [https://portal.azure.com/#settings/directory](https://portal.azure.com/#settings/directory) to obtain your tenant information.

```shell
az login --tenant xxxx
``` 

After executing the command, you will be automatically redirected to your browser to complete the authentication process.

After successful authentication, you can use the following command to view your account information.

```shell
az account show
{
  "environmentName": "AzureCloud",
  "homeTenantId": "00000000-0000-0000-0000-000000000000",
  "id": "00000000-0000-0000-0000-000000000000",
  "isDefault": true,
  "managedByTenants": [],
  "name": "Microsoft Azure 赞助",
  "state": "Enabled",
  "tenantId": "00000000-0000-0000-0000-000000000000",
  "user": {
    "name": "mail@example.com",
    "type": "user"
  }
}
```

If you have multiple subscriptions, you need to set the subscription that your account uses.

```shell
az account set --subscription 00000000-0000-0000-0000-000000000000
```

## Code

The script contains two parts:

- `resource-group`: All resources on Azure are created under a resource group. Before creating a virtual machine, you need to create a resource group or use an existing one. Creating a resource group will also create a virtual network and subnet.
- `virtual-machine`: As the name implies, it creates virtual machine resources.

### Create a Resource Group

Go to the `resource-group` directory and run the following command to initialize Terraform and download the Azure provider.

```shell
terraform init
``` 

In `the variables.tf` file, input variables for resource group name and location are defined. The following command can be used to create a resource group, and parameters can be specified for the name and location during creation.

Check the Terraform code by running the following command:

```shell
terraform validate
```

Apply the code by running the following command in the resource-group directory:

```shell
terraform apply
```

Or, you can specify the name and location parameters during creation by using the following command:

```shell
terraform apply -var "name=demo" -var "location=eastasia"
```

View the created resources by running the command terraform state list. Alternatively, you can view the details of the resources by using the command terraform show.

```shell
terraform state list 
azurerm_resource_group.demo 
azurerm_subnet.demo 
azurerm_virtual_network.demo
```

### Create a virtual machine

Navigate to the `virtual-machine` directory and run the following command to initialize:

```shell
terraform init
```

There are more parameters required to create a virtual machine, which are defined in `variables.tf`. The parameter values can be set in the `terraform.tfvars` file, and the subscription ID needs to be specified.

Check the code and parameters by running the following command:

```shell
terraform validate
```

Create the virtual machine by running the following command in the virtual-machine directory:

```shell
terraform apply
```

For example, if the vm_count is set to 3, the resources can be viewed by running the following command:

```shell
terraform state list

azurerm_linux_virtual_machine.demo[0]
azurerm_linux_virtual_machine.demo[1]
azurerm_linux_virtual_machine.demo[2]
azurerm_network_interface.demo[0]
azurerm_network_interface.demo[1]
azurerm_network_interface.demo[2]
azurerm_public_ip.demo[0]
azurerm_public_ip.demo[1]
azurerm_public_ip.demo[2]
```

You can use the command `terraform show` to view detailed information about resources, such as public IP addresses, and so on.