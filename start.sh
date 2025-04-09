#!/bin/bash

mkdir -p /books
rclone mount gdrive:calibre /books --allow-other --vfs-cache-mode writes &
ls /mnt/gdrive/MiBiblioteca/metadata.db
# Esperar a que monte
sleep 10

# Lanzar calibre-web
exec /init
