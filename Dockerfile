FROM linuxserver/calibre-web:latest

# Instala rclone
RUN apt-get update && apt-get install -y rclone

# Define el directorio de trabajo
WORKDIR /app/config

# Copia el script de configuración de rclone (si lo tienes)
COPY rclone.conf .

# Script para sincronizar Google Drive al inicio (opcional, pero recomendado)
COPY start.sh .
RUN chmod +x start.sh

# Comando para iniciar Calibre-Web (se sobrescribe en Render)
CMD ["/usr/bin/calibre-web"]
