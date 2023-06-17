FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y \
    ca-certificates lib32gcc-s1 wget unzip procps iproute2 \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /steamcmd && \
    cd /steamcmd && \
    wget http://media.steampowered.com/client/steamcmd_linux.tar.gz && \
    tar -xvzf steamcmd_linux.tar.gz && \
    rm steamcmd_linux.tar.gz

ENV PATH="/steamcmd:${PATH}"

RUN mkdir -p /asm && \
    cd /asm && \
    wget https://github.com/JustaPenguin/assetto-server-manager/releases/download/v1.7.9/server-manager_v1.7.9.zip && \
    unzip server-manager_v1.7.9.zip && \
    rm server-manager_v1.7.9.zip

WORKDIR /asm/linux

EXPOSE 8081/udp
EXPOSE 9600/udp
# Port in config.yml 0.0.0.0:80
EXPOSE 80

# Commande par défaut pour exécuter SteamCMD
CMD ["./server-manager"]