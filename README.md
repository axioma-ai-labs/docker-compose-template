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

5. Run the docker compose

```bash
docker-compose up -d
```

## How to scale or run in development mode

> [!NOTE]
> The `docker-compose.override.yml.prod` file is used to scale the backend and frontend.
> The `docker-compose.override.yml.dev` file is used to run the docker compose in development mode.
> To apply the override file, copy it to `docker-compose.override.yml` and run the docker compose.
