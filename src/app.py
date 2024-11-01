from flask import Flask, request
from prophet import __version__
from eye_prophet import forecast

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
    app.run(host='0.0.0.0', port=80)
