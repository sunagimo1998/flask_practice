docker compose down
docker ps -aq | xargs docker rm
docker images -aq | xargs docker rmi
docker compose build --no-cache
docker compose up -d
docker compose exec app bash

export FLASK_APP=app.py
export FLASK_ENV=development
flask run --host 0.0.0.0 --port 5000

curl -L http://www.gitignore.io/api/python,flask,vscode > .gitignore

flask db init
flask db migrate
flask db upgrade
flask db downgrade