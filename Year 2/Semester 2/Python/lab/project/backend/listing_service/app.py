from flask import Flask, jsonify, request
import json
from flask_cors import CORS

app = Flask(__name__)
CORS(app)


with open("listings.json") as f:
    listings = json.load(f)

@app.route("/listings/<listing_id>", methods=["GET"])
def get_listing(listing_id):
    listing = next((l for l in listings if l["id"] == listing_id), None)
    if listing:
        return jsonify(listing)
    else:
        return jsonify({"error": "Listing not found"}), 404

@app.route("/listings", methods=["GET"])
def get_all_listings():
    location = request.args.get("location", "").lower()
    checkin = request.args.get("checkin")
    checkout = request.args.get("checkout")
    guests = request.args.get("guests", type=int)

    
    filtered_listings = listings
    if location:
        filtered_listings = [
            l for l in filtered_listings
            if location in l["location"].lower()
        ]

    return jsonify(filtered_listings)

if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=5000)
