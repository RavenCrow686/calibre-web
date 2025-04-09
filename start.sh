#!/bin/bash
# Montar Google Drive
rclone mount gdrive:/ /app/books --allow-other --vfs-cache-mode writes &

# Ejecutar Calibre Web
python3 cps.py
