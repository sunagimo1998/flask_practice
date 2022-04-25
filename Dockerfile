FROM python:3.9.10-buster
SHELL ["/bin/bash", "-oeux", "pipefail", "-c"]

ENV PYTHONUNBUFFERED=1

RUN python3 -m venv venv
RUN . ./venv/bin/activate

#opencvのエラー解消
#https://cocoinit23.com/docker-opencv-importerror-libgl-so-1-cannot-open-shared-object-file/
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y libgl1-mesa-dev

#https://qiita.com/typecprint/items/3c56d2340a6736c26a58
#RUN ln -s /opt/homebrew/Cellar/libpng/1.6.37/lib/libpng16.16.dylib /usr/local/lib/libpng16.16.dylib
#RUN ln -s /opt/homebrew/Cellar/jpeg/9e/lib/libjpeg.9.dylib /usr/local/lib/libjpeg.9.dylib

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
RUN pip install opencv-python
# 下記エラー解消の為、バージョン指定
# /usr/local/lib/python3.9/site-packages/torchvision/io/image.py:13: UserWarning: Failed to load image Python extension:
#   warn(f"Failed to load image Python extension: {e}")
# https://discuss.pytorch.org/t/failed-to-load-image-python-extension-could-not-find-module/140278/30
RUN pip install torch==1.9.0
RUN pip install torchvision==0.10.0
#RUN pip install --upgrade torch==1.9.0
#RUN pip install --upgrade torchvision==0.10.0