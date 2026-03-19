FROM ubuntu:focal

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y ca-certificates curl libvulkan1 libopengl0 libx11-6 && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# REEMPLAZA ESTE LINK por el de tu GitHub Release
RUN curl -L -o /app/servidor.x86_64 "https://github.com/webupp/server-totito/releases/download/test3/servidor.x86_64"

RUN chmod +x /app/servidor.x86_64

EXPOSE 8910


CMD ["./servidor.x86_64", "--headless"]
