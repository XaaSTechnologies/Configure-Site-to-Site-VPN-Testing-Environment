{\rtf1\ansi\ansicpg1252\cocoartf2513
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww12760\viewh15360\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0

\f0\fs36 \cf0 az group delete --name RG-14-CONNECT-vNETs --yes\
\
az group create --name RG-14-CONNECT-vNETs --location westeurope\
\
az network vnet create \\\
    --resource-group RG-14-CONNECT-vNETs \\\
    --name Azure-VNET \\\
    --address-prefix 10.0.0.0/16 \\\
    --subnet-name Azure-Subnet-01 \\\
    --subnet-prefix 10.0.0.0/24 \\\
    --location westeurope\
\
\pard\pardeftab720\partightenfactor0
\cf0 az network vnet subnet create \\\
    --resource-group RG-14-CONNECT-vNETs \\\
    --vnet-name Azure-VNET \\\
    --address-prefix 10.0.255.0/27 \\\
    --name GatewaySubnet\
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0
\cf0 \
az network vnet create \\\
    --resource-group RG-14-CONNECT-vNETs \\\
    --name HQ-VNET \\\
    --address-prefix 172.20.0.0/16 \\\
    --subnet-name HQ-Subnet-01 \\\
    --subnet-prefix 172.20.0.0/24 \\\
    --location westeurope\
\
\pard\pardeftab720\partightenfactor0
\cf0 az network vnet subnet create \\\
    --resource-group RG-14-CONNECT-vNETs \\\
    --vnet-name HQ-VNET \\\
    --address-prefix 172.20.255.0/27 \\\
    --name GatewaySubnet\
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0
\cf0 \
\pard\pardeftab720\partightenfactor0
\cf0 az vm create \\\
    --resource-group RG-14-CONNECT-vNETs \\\
    --name Azure-VM \\\
    --location westeurope \\\
    --vnet-name Azure-VNET \\\
    --subnet Azure-Subnet-01 \\\
    --image UbuntuLTS \\\
    --size Standard_B1s \\\
    --admin-username adminuser \\\
    --admin-password adminadmin123!\
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0
\cf0 \
\pard\pardeftab720\partightenfactor0
\cf0 az vm create \\\
    --resource-group RG-14-CONNECT-vNETs \\\
    --name HQ-VM \\\
    --location westeurope \\\
    --vnet-name HQ-VNET \\\
    --subnet HQ-Subnet-01 \\\
    --image UbuntuLTS \\\
    --size Standard_B1s \\\
    --admin-username adminuser \\\
    --admin-password adminadmin123!\
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0
\cf0 \
}