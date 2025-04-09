#!/bin/bash
echo "Sincronizando libros desde Google Drive..."
rclone sync gdrive:/books /books --config /app/config/rclone.conf
echo "Sincronización completada."

# Inicia Calibre-Web
#/usr/bin/calibre-web

echo "Intentando iniciar Calibre-Web con python3 cps.py y redirigiendo la salida..."
python3 /app/config/cps.py
echo "Script cps.py terminado."

