FROM python:3.8-slim

# Instalar dependencias necesarias
RUN apt-get update && \
    apt-get install -y \
    libxml2 libxslt1.1 libxslt1-dev \
    libxml2-dev libjpeg-dev zlib1g-dev \
    git curl && \
    rm -rf /var/lib/apt/lists/*

# Clonar Calibre Web
RUN git clone https://github.com/janeczku/calibre-web.git /app

# Establecer el directorio de trabajo
WORKDIR /app

# Instalar las dependencias de Python
RUN pip install -r requirements.txt

# Exponer el puerto que utiliza Calibre Web
EXPOSE 8083

# Ejecutar la aplicación
CMD ["python3", "cps.py"]
