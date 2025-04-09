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
echo "Listando /app:"
ls -l /app/calibre*
echo "Listando /usr/local/bin:"
ls -l /usr/local/bin/calibre*
echo "Listando la raíz /:"
ls -l /calibre*

# Intenta iniciar Calibre-Web desde una posible ubicación
#/opt/calibre-web/calibre-web &
# Si la anterior falla, intenta esta:
# /app/calibre-web/calibre-web &
echo "Intentando iniciar Calibre-Web con python3 cps.py..."
python3 /app/config/cps.py &
echo "Calibre-Web iniciado (¿quizás?)."
