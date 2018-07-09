from flask import Flask, request
import os
from _prophet import forecast

app = Flask(__name__)

@app.route("/")
def root():
    html = "<h3>Welcome to eye-prophet!</h3>" \
           "<p>This is web server for forecasting time series data based on the <a href='https://facebook.github.io/prophet'>Prophet</a> v{version}"
    import fbprophet
    return html.format(version=fbprophet.__version__)

@app.route("/forecast", methods=['POST'])
def makeForecast():
    params = request.get_json(silent=True)
    result = forecast(params)
    return result.to_json(orient='split')

if __name__ == "__main__":
    port = int(os.environ.get("PORT", 80))
    app.run(host='0.0.0.0', port=port)