FROM python:3.9.10-buster
SHELL ["/bin/bash", "-oeux", "pipefail", "-c"]

ENV PYTHONUNBUFFERED=1

RUN python3 -m venv venv
RUN . ./venv/bin/activate

WORKDIR /flaskbook
RUN pip install flask