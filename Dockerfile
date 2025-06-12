FROM python:3.13.4-bookworm

COPY requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

WORKDIR /app

COPY ./src /app

CMD ["gunicorn", "app:app", "--bind", "0.0.0.0:80"]
