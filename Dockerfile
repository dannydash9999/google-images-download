# Usa una imagen base oficial de Python
FROM python:3.10-slim

# Establece el directorio de trabajo
WORKDIR /app

# Copia los archivos del proyecto al contenedor
COPY . /app

# Instala las dependencias
RUN pip install --no-cache-dir -r requirements.txt

# Instala la herramienta como ejecutable
RUN python setup.py install

# Comando por defecto 
ENTRYPOINT ["googleimagesdownload"]
