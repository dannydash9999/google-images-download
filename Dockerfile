FROM python:3.10-slim

# Evita interacción al instalar paquetes
ENV DEBIAN_FRONTEND=noninteractive

# Instala herramientas del sistema necesarias
RUN apt-get update && apt-get install -y \
    gcc \
    libffi-dev \
    libxml2-dev \
    libxslt1-dev \
    zlib1g-dev \
    libjpeg-dev \
    libpng-dev \
    && rm -rf /var/lib/apt/lists/*

# Crea y usa un directorio de trabajo
WORKDIR /app

# Copia el contenido del repo
COPY . .

# Instala las dependencias desde setup.py
RUN pip install --upgrade pip setuptools wheel
RUN python setup.py install

# Ejecuta el script con este comando
ENTRYPOINT ["googleimagesdownload"]
