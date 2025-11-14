#!/bin/bash
set -ex

source .env

#copiamos la plantilla del archivo VirtualHost en el sevidor
cp ../conf/000-default.conf /etc/apache2/sites-available

# Configuramos el serverName en el virtualHost
sed -i "s/PUT_YOUR_CERBOT_DOMAIN_HERE/$CERBOT_DOMAIN/" /etc/apache2/sites-available/000-default.conf

sudo snap install core
sudo snap refresh core

sudo apt remove certbot -y

sudo snap install --classic certbot

sudo certbot --apache -m $CERBOT_CORREO --agree-tos --no-eff-email -d $CERBOT_DOMAIN --non-interactive