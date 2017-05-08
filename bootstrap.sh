#!/bin/bash
set -eux
mkdir -p /etc/caddy /etc/caddy/sites /etc/ssl/caddy
echo 'import sites/*' > /etc/caddy/Caddyfile
chown -R root:www-data /etc/caddy
chown -R www-data:root /etc/ssl/caddy
chmod 0770 /etc/ssl/caddy

curl -fsSL https://getcaddy.com | bash -s http.git,http.hugo
curl -fsSL -o /etc/systemd/system/caddy.service https://raw.githubusercontent.com/mholt/caddy/master/dist/init/linux-systemd/caddy.service
# Inject a randomly generated token for github webhook
sed -i '/\[Service\]/a Environment=GITHUB_WEBHOOK_SECRET='`uuidgen` caddy.service
curl -fsSL -o /etc/caddy/sites/joneskoo.yx.fi.conf https://raw.githubusercontent.com/joneskoo/joneskoo.yx.fi/master/Caddyfile

chown root:root /etc/systemd/system/caddy.service
chmod 644 /etc/systemd/system/caddy.service

mkdir -p /var/www /var/www/joneskoo.yx.fi
chown -R www-data:www-data /var/www
chmod -R a+rX /var/www

apt-get update && apt-get install -qyy python-pygments
wget https://github.com/spf13/hugo/releases/download/v0.19/hugo_0.19-64bit.deb
dpkg -i hugo_0.19-64bit.deb

systemctl enable caddy.service
systemctl daemon-reload
systemctl start caddy.service
