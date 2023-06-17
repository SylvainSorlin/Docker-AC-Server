<h1 align="center">Docker-AC-Server</h1>

<p align="center">
  <a href="https://www.gnu.org/licenses/gpl-3.0.en.html"><img src="https://img.shields.io/badge/License-GPLv3-blue.svg" alt="License"></a>
  <img src="https://img.shields.io/badge/Docker-%231572B6.svg?&style=flat-square&logo=docker&logoColor=white" alt="Docker">
</p>

**Run an Assetto Corsa server using [Assetto Server Manager](https://github.com/JustaPenguin/assetto-server-manager) in a Docker container.**

## Instructions

Follow these steps to run the Assetto Corsa server using Docker:

1. Install Docker on your machine. Refer to the [official Docker documentation](https://docs.docker.com/get-docker/) for instructions specific to your operating system.

2. Clone this repository to your local machine:
```bash
git clone https://github.com/SylvainSorlin/Docker-AC-Server.git
```

3. Navigate to Docker-AC-Server repository:
```bash
cd Docker-AC-Server
```

4. Build the Docker image:
```bash
docker build -t assetto-corsa-server .
```

5. Create and configure your [config.yml](https://github.com/JustaPenguin/assetto-server-manager/blob/master/cmd/server-manager/config.example.yml), if needed, modify the port in the Dockerfile "EXPOSE 80"

7. Run a Docker container based on the built image:
```bash
docker run -d -p 8081:8081/udp -p 9600:9600/udp YOUR_PATH/config.yml:/asm/linux/config.yml assetto-corsa-server
```
8. Open url to serve-manager
http://localhost:80

## docker-compose
If you don't want or don't have "Traefik", you just need to comment out the "labels" section and add the port you expose in your Dockerfile and your config.yml. 
For your information, I'm using a Traefik+Portainer configuration.

```yaml
version: "3"

networks:
  traefik_default:
    external: true

volumes:
  ac_server-install:
    driver: local

services:
  acserver:
    image: ac-server:latest
    restart: always
    labels:
      - "traefik.enable=true"
      - "traefik.http.routers.acserver.entrypoints=websecure"
      - "traefik.http.routers.acserver.rule=Host(`acserver.domain.fr`)"
      - "traefik.http.routers.acserver.tls.certresolver=myresolver"
    ports:
      - "9600:9600/udp"
      - "8081:8081/udp"
    networks:
      - traefik_default
    volumes: 
      - ac_server-install:/assetto
      - YOUR_PATH/config.yml:/asm/linux/config.yml
```

## License
This project is licensed under the [GNU General Public License v3.0](https://www.gnu.org/licenses/gpl-3.0.en.html).
