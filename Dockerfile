FROM python:3.8-slim

# Instalar dependencias necesarias
RUN apt-get update && \
    apt-get install -y \
    libxml2 libxslt1.1 libxslt1-dev \
    libxml2-dev libjpeg-dev zlib1g-dev \
    git curl fuse

# Instalar rclone manualmente
RUN curl -fsSL https://github.com/rclone/rclone/releases/download/v1.58.0/rclone-v1.58.0-linux-amd64.tar.gz -o rclone.tar.gz && \
    tar -xvzf rclone.tar.gz && \
    cd rclone-v1.58.0-linux-amd64 && \
    cp rclone /usr/bin/ && \
    rm -rf /rclone.tar.gz /rclone-v1.58.0-linux-amd64

# Clonar Calibre Web
RUN git clone https://github.com/janeczku/calibre-web.git /app

# Copiar el archivo de configuración rclone.conf al contenedor
COPY config/rclone/rclone.conf /config/rclone/rclone.conf

# Establecer el directorio de trabajo
WORKDIR /app

# Instalar las dependencias de Python
RUN pip install -r requirements.txt

# Exponer el puerto que utiliza Calibre Web
EXPOSE 8083

# Crear un directorio para almacenar los libros (Google Drive se montará aquí)
RUN mkdir -p /app/books

# Ejecutar rclone y Calibre Web en segundo plano
CMD rclone mount gdrive:/ /app/books --allow-other --vfs-cache-mode writes & python3 cps.py
