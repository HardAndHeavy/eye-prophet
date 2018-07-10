from flask import Flask, request
import os
from fbprophet import __version__
from _prophet import forecast

app = Flask(__name__)

@app.route("/")
def root():
    html = "<h3>Welcome to eye-prophet!</h3>" \
           "<p>This is web server for forecasting time series data based on the <a href='https://facebook.github.io/prophet'>Prophet</a> v{version}"
    return html.format(version=__version__)

@app.route("/forecast", methods=['POST'])
def makeForecast():
    params = request.get_json(silent=True)
    result = forecast(params)
    return result.to_json(orient='split')

@app.route("/version")
def version():
    return __version__

if __name__ == "__main__":
    port = int(os.environ.get("PORT", 80))
    app.run(host='0.0.0.0', port=port)