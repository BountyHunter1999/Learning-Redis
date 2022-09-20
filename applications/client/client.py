from distutils.log import debug
from flask import Flask
import os
from redis import Redis

app = Flask(__name__)
app.config['REDIS_HOST'] = os.getenv("REDIS_HOST")
app.config['REDIS_PORT'] = os.getenv("REDIS_PORT")
app.config['REDIS_PASSWORD'] = os.getenv("REDIS_PASSWORD")

print(app.config)


@app.route("/")
def index():
    r = Redis(host=app.config['REDIS_HOST'], password=app.config['REDIS_PASSWORD'], port=int(app.config['REDIS_PORT']))
    print(r)
    r.incr("Hits")
    hits= r.get('Hits').decode()
    return f"this sit was visited: {hits} times"

@app.route("/check")
def check():
    r = Redis(app)
    print(r)
    r.incr("Hits")
    hits= r.get('Hits').decode()
    return f"this sit was visited: {hits} times from check"

if __name__ == "__main__":
    app.run(host="0.0.0.0", debug=True)