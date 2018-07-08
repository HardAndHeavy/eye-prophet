FROM python

WORKDIR /app
ADD . /app

RUN apt-get update -y
RUN apt-get install -y \
  python3-dev \
  python-dev

RUN pip install -r requirements.txt

EXPOSE 80

CMD ["python", "app.py"]