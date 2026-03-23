from flask import Flask

app = Flask(__name__)

@app.route('/')
def home():
    return "Simple GitHub Action Deployment!"

if __name__ == '__main__':
    app.run()
