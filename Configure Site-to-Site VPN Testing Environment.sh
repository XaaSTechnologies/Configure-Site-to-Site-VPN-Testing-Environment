az group delete --name RG-14-CONNECT-vNETs --yes

az group create --name RG-14-CONNECT-vNETs --location westeurope

az network vnet create \
    --resource-group RG-14-CONNECT-vNETs \
    --name Azure-VNET \
    --address-prefix 10.0.0.0/16 \
    --subnet-name Azure-Subnet-01 \
    --subnet-prefix 10.0.0.0/24 \
    --location westeurope

az network vnet subnet create \
    --resource-group RG-14-CONNECT-vNETs \
    --vnet-name Azure-VNET \
    --address-prefix 10.0.255.0/27 \
    --name GatewaySubnet

az network vnet create \
    --resource-group RG-14-CONNECT-vNETs \
    --name HQ-VNET \
    --address-prefix 172.20.0.0/16 \
    --subnet-name HQ-Subnet-01 \
    --subnet-prefix 172.20.0.0/24 \
    --location westeurope

az network vnet subnet create \
    --resource-group RG-14-CONNECT-vNETs \
    --vnet-name HQ-VNET \
    --address-prefix 172.20.255.0/27 \
    --name GatewaySubnet

az vm create \
    --resource-group RG-14-CONNECT-vNETs \
    --name Azure-VM \
    --location westeurope \
    --vnet-name Azure-VNET \
    --subnet Azure-Subnet-01 \
    --image UbuntuLTS \
    --size Standard_B1s \
    --admin-username adminuser \
    --admin-password adminadmin123!

az vm create \
    --resource-group RG-14-CONNECT-vNETs \
    --name HQ-VM \
    --location westeurope \
    --vnet-name HQ-VNET \
    --subnet HQ-Subnet-01 \
    --image UbuntuLTS \
    --size Standard_B1s \
    --admin-username adminuser \
    --admin-password adminadmin123!
