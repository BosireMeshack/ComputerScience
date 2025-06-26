from flask import Flask, request, jsonify
from airbnb import User, Listing, Booking
from datetime import datetime

app = Flask(__name__)

# In-memory data storage
users = []
listings = []
bookings = []

@app.route("/users", methods=["POST"])
def create_user():
    data = request.get_json()
    user = User(data["name"], data["email"])
    users.append(user)
    return jsonify(user.to_dict()), 201


@app.route("/listings", methods=["POST"])
def create_listing():
    data = request.get_json()
    listing = Listing(
        title=data["title"],
        description=data["description"],
        price_per_night=data["price_per_night"],
        location=data["location"],
        owner_id=data["owner_id"]
    )
    listings.append(listing)
    return jsonify(listing.to_dict()), 201


@app.route("/bookings", methods=["POST"])
def create_booking():
    data = request.get_json()

   
    try:
        start_date = datetime.strptime(data["start_date"], "%Y-%m-%d")
        end_date = datetime.strptime(data["end_date"], "%Y-%m-%d")
    except ValueError:
        return jsonify({"error": "Invalid date format. Use YYYY-MM-DD."}), 400

    
    listing = next((l for l in listings if l.id == data["listing_id"]), None)
    if not listing:
        return jsonify({"error": "Listing not found."}), 404

    
    booking = Booking(data["user_id"], listing, start_date, end_date)
    bookings.append(booking)
    return jsonify(booking.to_dict()), 201


@app.route("/listings", methods=["GET"])
def list_listings():
    location = request.args.get("location")
    if location:
        filtered = [l.to_dict() for l in listings if l.location.lower() == location.lower()]
        return jsonify(filtered)
    return jsonify([l.to_dict() for l in listings])


if __name__ == "__main__":
    app.run(debug=True, port=8000)
