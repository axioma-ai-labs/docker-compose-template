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
> Pay attention to the REDIS_PASSWORD in the .env file. It must be the same as the password in the redis.conf file and respective to the REDIS_PASSWORD_FILE in the docker-compose.yml file.

3. Create the volumes

```bash
mkdir -p volumes/postgres/data
mkdir -p volumes/redis/data
mkdir -p volumes/pgadmin/data
```

Give right permissions to the volumes

```bash
chmod -R 777 volumes
```

4. Create the secrets

```bash
echo db-password >secrets/db-password
echo pgadmin-password >secrets/pgadmin-password
```

Give the right permissions to the secrets:

```bash
chmod -R 777 secrets
```

> [!WARNING]
> Configure the secrets with your own values!

> [!NOTE]
> The `redis-password` must be the same as the password in the redis.conf file and REDIS_PASSWORD in the .env file. See next sections for more details.

5. Setup the configuration

```bash
mkdir -p config/nginx
cp utils/nginx/nginx.conf config/nginx

mkdir -p config/pgadmin
cp utils/pgadmin/servers.json config/pgadmin

mkdir -p config/redis
cp utils/redis/redis.conf config/redis
```

Give the right permissions to the directories:

```bash
chmod -R 777 config
```

> [!NOTE]
> The `redis.conf` file is used to configure the redis database. The password must be the same as the password in the `secrets/redis-password` file and REDIS_PASSWORD in the .env file.

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
- Redis Commander: http://localhost:3031
