# docker-compose-template
Template for Docker Compose Orchestrations.

## How to use
1. Clone the repository

```bash
git clone https://github.com/axioma-ai-labs/docker-compose-template.git
```

2. Copy environment variables

```bash
cp .env.example .env
```

> [!WARNING]
> Configure the environment variables with your own values.

3. Create the volumes

```bash
mkdir -p volumes/postgres/data
mkdir -p volumes/redis/data
mkdir -p volumes/pgadmin/data
```

4. Create the secrets

```bash
echo db-password >secrets/db-password
echo pgadmin-password >secrets/pgadmin-password
```

> [!WARNING]
> Configure the secrets with your own values!

5. Setup the configuration

```bash
mkdir -p config/nginx
cp utils/nginx/nginx.conf config/nginx

mkdir -p config/pgadmin
cp utils/pgadmin/servers.json config/pgadmin
```

6. Copy the override file

```bash
cp docker-compose.override.yml.dev docker-compose.override.yml
```

> [!NOTE]
> The `docker-compose.override.yml.dev` file is used to run the docker compose in development mode.
> The `docker-compose.override.yml.prod` file is used to scale the backend and frontend.
> Review the ports and other settings in the `docker-compose.override.yml` file.

7. Run the docker compose

```bash
docker-compose up -d
```

## Accessing the services

With the default configuration, you can access the services at the following ports:

- Postgres: http://localhost:3020
- Redis: http://localhost:3030
- pgAdmin: http://localhost:3041
