from flask import Flask

app = Flask(__name__)

@app.route('/')
def home():
    return "Back to the Basics. A simple Flask app running on Python 3.10.5"

if __name__ == '__main__':
    app.run()
