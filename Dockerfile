FROM python:3.6-alpine

RUN apk --no-cache --update-cache add gcc g++ gfortran build-base wget freetype-dev libpng-dev openblas-dev python-dev python3-dev
RUN ln -s /usr/include/locale.h /usr/include/xlocale.h

RUN pip3 install --upgrade --no-cache-dir pip
RUN pip3 install --upgrade --no-cache-dir setuptools
RUN pip3 install --upgrade --no-cache-dir numpy
RUN pip3 install --upgrade --no-cache-dir fbprophet
RUN pip3 install --upgrade --no-cache-dir Flask
RUN pip3 install --upgrade --no-cache-dir gunicorn

EXPOSE 80

WORKDIR /deploy/app
COPY ./app /deploy/app
COPY gunicorn_config.py /deploy/gunicorn_config.py

CMD gunicorn app:app --config /deploy/gunicorn_config.py