FROM python:3.8-slim

# Instalar dependencias necesarias
RUN apt-get update && \
    apt-get install -y \
    libxml2 libxslt1.1 libxslt1-dev \
    libxml2-dev libjpeg-dev zlib1g-dev \
    git curl \
    fuse  # Necesario para rclone

# Instalar rclone
RUN curl https://rclone.org/install.sh | bash

# Clonar Calibre Web
RUN git clone https://github.com/janeczku/calibre-web.git /app

# Copiar el archivo de configuración rclone.conf al contenedor
COPY config/rclone/rclone.conf /config/rclone/rclone.conf

# Establecer el directorio de trabajo
WORKDIR /app

# Instalar las dependencias de Python
RUN pip install -r requirements.txt

# Copiar el script de inicio
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Exponer el puerto que utiliza Calibre Web
EXPOSE 8083

# Crear un directorio para almacenar los libros (Google Drive se montará aquí)
RUN mkdir -p /app/books

# Ejecutar el script de inicio
CMD ["/start.sh"]

