from flask import Flask, jsonify, request
import socket

app = Flask(__name__)


@app.route("/")
def index():
    host_ip = socket.gethostbyname(socket.gethostname())
    return jsonify(
        {
            "message": "Hello, World! This is a Flask app running on EC2 with Host: {}".format(
                host_ip
            )
        }
    )


@app.route("/health", methods=["GET"])
def health_check():
    return jsonify({"status": "healthy"}), 200


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)
