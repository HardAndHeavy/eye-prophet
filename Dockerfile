FROM python:3.13.0-bookworm

COPY requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

WORKDIR /app

COPY ./src /app

CMD python app.py
