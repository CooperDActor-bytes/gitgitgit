#!/bin/bash
sudo apt install docker docker-compose wget curl lighttpd lighttpd-fastcgi php-common php-cli php-pdo php-xml php-json php-intl cronie curl findutils sudo unzip libidn2 psmisc libcap nmap-ncat jq git dialog iproute newt procps-ng chkconfig ca-certificates -y
curl -s https://mailinabox.email/setup.sh | sudo -E bash
curl -sSL https://install.pi-hole.net | bash
curl -L --output cloudflared.deb https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb && 

sudo dpkg -i cloudflared.deb

cd /tmp
curl -O https://kasm-static-content.s3.amazonaws.com/kasm_release_1.15.0.06fdc8.tar.gz
tar -xf kasm_release_1.15.0.06fdc8.tar.gz
sudo bash kasm_release/install.sh

cd 
git clone https://github.com/CooperDActor/peppermint.git
cd peppermint 

sudo docker-compose up -d

 curl -fsSL https://get.casaos.io | sudo bash

wget https://raw.githubusercontent.com/ant-media/Scripts/master/install_ant-media-server.sh -O install_ant-media-server.sh  && chmod 755 install_ant-media-server.sh
sudo ./install_ant-media-server.sh

echo finished
