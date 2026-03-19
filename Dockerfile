# Usamos una imagen base ligera
FROM ubuntu:focal

# Evitar prompts interactivos
ENV DEBIAN_FRONTEND=noninteractive

# Instalar dependencias necesarias para Godot
RUN apt-get update && apt-get install -y \
    ca-certificates \
    libvulkan1 \
    libopengl0 \
    libx11-6 \
    && rm -rf /var/lib/apt/lists/*

# Crear directorio de trabajo
WORKDIR /app

# Copiar el ejecutable del servidor y el archivo .pck
# Reemplaza "servidor.x86_64" por el nombre de tu archivo exportado
COPY servidor.x86_64 /app/
#COPY servidor.pck /app/

# Dar permisos de ejecución
RUN chmod +x /app/servidor.x86_64

# Exponer el puerto de WebSockets
EXPOSE 8910

# Ejecutar el servidor en modo headless (sin ventana)
CMD ["./servidor.x86_64", "--headless"]
