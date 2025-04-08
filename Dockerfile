FROM python:3.10-slim

# Instala dependencias
RUN apt-get update && apt-get install -y \
    git \
    gcc \
    libffi-dev \
    libssl-dev \
    libxml2-dev \
    libxslt-dev \
    zlib1g-dev \
    libjpeg-dev \
    libpq-dev \
    rclone \
    fuse \
    && apt-get clean

# Crea carpetas necesarias
RUN mkdir -p /app/calibre /root/.config/rclone

# Establece el directorio de trabajo
WORKDIR /app

# Clona Calibre-Web desde GitHub
RUN git clone https://github.com/janeczku/calibre-web .

# Copia el archivo rclone.conf si lo montas (ver notas abajo)
# ADD rclone.conf /root/.config/rclone/rclone.conf

# Monta Google Drive cuando arranque
CMD bash -c "\
echo \"$RCLONE_CONFIG\" > /root/.config/rclone/rclone.conf && \
rclone mount gdrive:calibre-biblioteca /app/calibre --daemon --allow-other && \
python3 cps.py"
