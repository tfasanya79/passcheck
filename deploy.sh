#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
git pull --ff-only
sudo mkdir -p /var/www/passcheck
sudo cp -r ./index.html /var/www/passcheck/
sudo chown -R caddy:caddy /var/www/passcheck
echo "Deployed passcheck $(git rev-parse --short HEAD)"
