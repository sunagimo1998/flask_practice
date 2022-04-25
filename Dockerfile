FROM python:3.9.10-buster
SHELL ["/bin/bash", "-oeux", "pipefail", "-c"]

ENV PYTHONUNBUFFERED=1

RUN python3 -m venv venv
RUN . ./venv/bin/activate

WORKDIR /flaskbook
RUN pip install flask
RUN pip install flake8 black isort mypy
RUN pip install python-dotenv
# P62
RUN pip install email-validator
# P67
RUN pip install flask-debugtoolbar
# P68
RUN pip install flask-mail
# P96
RUN pip install flask-sqlalchemy
RUN pip install flask-migrate
RUN pip install flask-wtf
RUN pip install flask-login
RUN pip install torch torchvision opencv-python