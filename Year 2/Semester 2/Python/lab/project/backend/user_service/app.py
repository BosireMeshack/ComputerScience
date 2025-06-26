
from flask import Flask, jsonify
import json

app = Flask(__name__)

with open("users.json") as f:
    users = json.load(f)

@app.route("/users/<user_id>", methods=["GET"])
def get_user(user_id):
    user = next((u for u in users if u["id"] == user_id), None)
    if user:
        return jsonify(user)
    else:
        return jsonify({"error": "User not found"}), 404

if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=5000)
