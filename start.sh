#!/bin/bash
echo "Sincronizando libros desde Google Drive..."
rclone sync gdrive:/books /books --config /app/config/rclone.conf
echo "Sincronización completada."

# Inicia Calibre-Web
#/usr/bin/calibre-web
echo "Listando /usr/bin:"
ls -l /usr/bin/calibre*
ls -l /opt/calibre-web/
ls -l /app/calibre-web/

# Intenta iniciar Calibre-Web desde una posible ubicación
/opt/calibre-web/calibre-web &
# Si la anterior falla, intenta esta:
# /app/calibre-web/calibre-web &
