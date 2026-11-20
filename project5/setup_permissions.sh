#!/bin/bash
set -e

# Create groups
sudo groupadd -f developers
sudo groupadd -f auditors

# Create users and assign groups
id -u dev_user &>/dev/null || sudo useradd -m -s /bin/bash -G developers dev_user
id -u audit_user &>/dev/null || sudo useradd -m -s /bin/bash -G auditors audit_user

# Create protected directory and file
sudo mkdir -p /srv/dev_secrets
echo "TOP SECRET: Production DB credentials & deployment keys" | sudo tee /srv/dev_secrets/secrets.txt > /dev/null

# Set ownership and permissions (2770 = rwxrws---)
sudo chown -R root:developers /srv/dev_secrets
sudo chmod 2770 /srv/dev_secrets
sudo chmod 660 /srv/dev_secrets/secrets.txt
