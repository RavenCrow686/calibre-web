#!/bin/bash
echo "Sincronizando libros desde Google Drive..."
rclone sync gdrive:/books /books --config /app/config/rclone.conf
echo "Sincronización completada."

# Inicia Calibre-Web
#/usr/bin/calibre-web

echo "Listando /usr/bin:"
ls -l /usr/bin/calibre*
echo "Listando /opt/calibre-web:"
ls -l /opt/calibre-web/calibre*
echo "Listando /usr/local/bin:"
ls -l /usr/local/bin/calibre*

