<h1 align="center">Docker-AC-Server</h1>

<p align="center">
  <a href="https://www.gnu.org/licenses/gpl-3.0.en.html"><img src="https://img.shields.io/badge/License-GPLv3-blue.svg" alt="License"></a>
  <img src="https://img.shields.io/badge/Docker-%231572B6.svg?&style=flat-square&logo=docker&logoColor=white" alt="Docker">
</p>

<p align="center">
  <strong>Run an Assetto Corsa server using LinuxGSM in a Docker container.</strong>
</p>

## Instructions

Follow these steps to run the Assetto Corsa server using Docker:

1. Install Docker on your machine. Refer to the [official Docker documentation](https://docs.docker.com/get-docker/) for instructions specific to your operating system.

2. Clone this repository to your local machine:

```bash
git clone https://github.com/your-username/your-repository.git
```

3. Navigate to Docker-AC-Server repository:
```bash
cd Docker-AC-Server
```

4. Open the Dockerfile in a text editor and fill in the environment variables STEAM_USER and STEAM_PASS with the appropriate values:
```dockerfile
ENV STEAM_USER="your-steam-username"
ENV STEAM_PASS="your-steam-password"
```

5. Build the Docker image:
```bash
docker build -t assetto-corsa-server .
```

6. Run a Docker container based on the built image:
```bash
docker run -d -p 8766:8766/udp -p 27015:27015/udp assetto-corsa-server
```

## Customization

You can customize the server configuration by modifying the appropriate files in the `lgsm/config-lgsm/acserver` directory. Refer to the [LinuxGSM documentation](https://docs.linuxgsm.com/) for more information on configuring the server.

## License
This project is licensed under the [GNU General Public License v3.0](https://www.gnu.org/licenses/gpl-3.0.en.html).