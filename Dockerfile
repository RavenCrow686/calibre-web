FROM linuxserver/calibre-web

# Instala rclone
RUN apt update && apt install -y rclone fuse && apt clean

# Copia la configuración de rclone
COPY rclone.conf /config/rclone.conf

# Montar Google Drive al iniciar
COPY start.sh /config/start.sh
RUN chmod +x /config/start.sh

ENTRYPOINT ["/config/start.sh"]
