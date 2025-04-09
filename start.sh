#!/bin/bash
echo "Sincronizando libros desde Google Drive..."
rclone sync gdrive:/books /books --config /app/config/rclone.conf
echo "Sincronización completada."

# Inicia Calibre-Web
/usr/bin/calibre-web
