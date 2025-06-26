# booking_service/app.py
import requests
from flask import Flask, request, jsonify
from flask_cors import CORS 
from models import Booking
from datetime import datetime

app = Flask(__name__)
CORS(app) 
bookings = []

class Listing:
    def __init__(self, id, price_per_night):
        self.id = id
        self.price_per_night = price_per_night

@app.route("/bookings", methods=["POST"])
def create_booking():
    data = request.get_json()
    try:
        
        listing_response = requests.get(f"http://listing_service:5000/listings/{data['listing_id']}")
        if listing_response.status_code != 200:
            return jsonify({"error": "Listing not found"}), 404
        listing_data = listing_response.json()
        listing = Listing(id=listing_data["id"], price_per_night=listing_data["price_per_night"])

        
        user_id = data.get("user_id")
        if user_id:
            user_response = requests.get(f"http://user_service:5000/users/{user_id}")
            if user_response.status_code != 200:
                return jsonify({"error": "User not found"}), 404

        
        start_date = datetime.strptime(data["start_date"], "%Y-%m-%d")
        end_date = datetime.strptime(data["end_date"], "%Y-%m-%d")

        booking = Booking(
            user_id=user_id,
            listing=listing,
            start_date=start_date,
            end_date=end_date,
            guest_info=data["guest_info"]
        )

        bookings.append(booking)
        return jsonify(booking.to_dict()), 201

    except Exception as e:
        app.logger.error(f"Error: {e}")
        return jsonify({"error": "Internal server error"}), 500

@app.route("/bookings", methods=["GET"])
def list_bookings():
    return jsonify([b.to_dict() for b in bookings])

if __name__ == '__main__':
    app.run(debug=True, host="0.0.0.0", port=8003)
