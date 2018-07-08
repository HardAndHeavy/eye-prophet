from flask import Flask, request
from _prophet import forecast

app = Flask(__name__)

@app.route("/", methods=['POST'])
def root():
    params = request.get_json(silent=True)
    result = forecast(params)
    return result.to_json(orient='split')

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=80)