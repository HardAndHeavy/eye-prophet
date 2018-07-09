FROM python:3.6

WORKDIR /app
ADD . /app

RUN apt-get update -y
RUN apt-get install -y python3 python3-dev python3-pip
RUN apt-get -y install cmake

RUN pip3 install --upgrade pip
RUN pip3 install --upgrade setuptools
RUN pip3 install --upgrade Flask
RUN pip3 install --upgrade numpy
RUN pip3 install --upgrade scipy scikit-learn pandas statsmodels
RUN pip3 install --upgrade pystan cython
RUN pip3 install --upgrade fbprophet

EXPOSE 80

CMD ["python", "app.py"]