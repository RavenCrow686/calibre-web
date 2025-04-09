#!/bin/bash

mkdir -p /books
rclone mount gdrive:calibre /books --allow-other --vfs-cache-mode writes &

# Esperar a que monte
sleep 10

# Lanzar calibre-web
exec /init
