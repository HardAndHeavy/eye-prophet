from flask import Flask, request
import os
from _prophet import forecast

app = Flask(__name__)

@app.route("/", methods=['POST'])
def root():
    params = request.get_json(silent=True)
    result = forecast(params)
    return result.to_json(orient='split')

@app.route("/version")
def version():
    import fbprophet
    return fbprophet.__version__

if __name__ == "__main__":
    port = int(os.environ.get("PORT", 80))
    app.run(host='0.0.0.0', port=port)