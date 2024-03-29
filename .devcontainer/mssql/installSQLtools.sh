#!/bin/bash
echo "Installing prerequesites"
sudo apt-get update
sudo apt-get install software-properties-common -y

echo "Installing SQLCmd Go"
curl https://packages.microsoft.com/keys/microsoft.asc | sudo tee /etc/apt/trusted.gpg.d/microsoft.asc
sudo add-apt-repository "$(wget -qO- https://packages.microsoft.com/config/ubuntu/20.04/prod.list)"
sudo apt-get install sqlcmd

echo "Installing sqlpackage"
curl -sSL -o sqlpackage.zip "https://aka.ms/sqlpackage-linux"
mkdir /opt/sqlpackage
unzip sqlpackage.zip -d /opt/sqlpackage 
rm sqlpackage.zip
chmod a+x /opt/sqlpackage/sqlpackage

# echo "Installing Data API Builder"
# dotnet tool install --global  Microsoft.DataApiBuilder