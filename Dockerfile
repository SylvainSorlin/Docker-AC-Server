FROM debian:bullseye

RUN dpkg --add-architecture i386 && apt-get update && apt-get upgrade -y

RUN apt-get install -y curl wget file tar bzip2 gzip unzip bsdmainutils python3 util-linux ca-certificates \
    binutils bc jq tmux netcat lib32gcc-s1 lib32stdc++6 lib32gcc-10-dev lib32stdc++6 libc6-i386 \
    cpio distro-info libsdl2-2.0-0:i386 xz-utils iproute2 procps vim

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

### AcServer
RUN useradd -m -s /bin/bash acserver
USER acserver

WORKDIR /home/acserver

RUN wget -O linuxgsm.sh https://linuxgsm.sh && chmod +x linuxgsm.sh && bash linuxgsm.sh acserver

ENV STEAM_USER=""
ENV STEAM_PASS=""

RUN mkdir -p lgsm/config-lgsm/acserver/ && \
    echo "steamuser=\"${STEAM_USER}\"" > lgsm/config-lgsm/acserver/common.cfg && \
    echo "steampass='${STEAM_PASS}'" >> lgsm/config-lgsm/acserver/common.cfg

RUN ./acserver auto-install --silent

EXPOSE 8081/udp
EXPOSE 9600/udp

VOLUME /home/acserver

CMD echo "Y" | ./acserver d