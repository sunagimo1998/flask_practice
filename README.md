docker compose down
docker ps -aq | xargs docker rm
docker images -aq | xargs docker rmi
docker compose build --no-cache
docker compose up -d
docker compose exec app bash