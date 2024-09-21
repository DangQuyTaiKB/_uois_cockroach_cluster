# up.ps1

# Build the Docker images without using the cache
docker-compose build --no-cache

# Start the Docker containers in detached mode
docker-compose up -d

# Execute the CockroachDB SQL command to create a user
docker-compose exec roach-0 `
    /cockroach/cockroach sql `
    --certs-dir=/certs --host=roach-0 `
    --execute="CREATE USER IF NOT EXISTS roach WITH PASSWORD 'roach';"

# Execute the CockroachDB SQL command to grant admin privileges to the user
docker-compose exec roach-0 `
    /cockroach/cockroach sql `
    --certs-dir=/certs --host=roach-0 `
    --execute="GRANT ADMIN TO roach;"

# Uncomment the following line if you need to copy certificates from the container
# docker cp roach-0:/certs .

# Execute the CockroachDB SQL command to create a database mycrdb
docker-compose exec roach-0 `
    /cockroach/cockroach sql `
    --certs-dir=/certs --host=roach-0 `
    --execute="CREATE DATABASE IF NOT EXISTS mycrdb;"


# Execute the CockroachDB SQL command to create a user admin
