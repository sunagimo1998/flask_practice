FROM python:3.9.10-buster
SHELL ["/bin/bash", "-oeux", "pipefail", "-c"]

ENV PYTHONUNBUFFERED=1

WORKDIR /flaskbook
RUN touch test.txt
# RUN python3 -m venv venv
# RUN . ./venv/bin/activate
# RUN pip install flask