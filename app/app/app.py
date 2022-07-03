from flask import Flask, request, render_template
import datetime
import pytz

app = Flask(__name__)

@app.route("/")
def index():
    return render_template("index.html", datetime = datetime.datetime, pytz=pytz)

@app.route('/health')
def health():
    return {'status': 'Healthy'}  # This will return as JSON by default with a 200 status code


if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0', port='8080')