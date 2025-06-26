import requests

BASE_URL = "http://localhost:8000"

# Creating a user
user_payload = {"name": "Alice", "email": "alice@example.com"}
user_response = requests.post(f"{BASE_URL}/users", json=user_payload)
user = user_response.json()
print("User created:", user)

# Listing creation
listing_payload = {
    "title": "Cozy Cottage",
    "description": "Near the lake",
    "price_per_night": 100,
    "location": "Nairobi",
    "owner_id": user["id"]
}
listing_response = requests.post(f"{BASE_URL}/listings", json=listing_payload)
listing = listing_response.json()
print("Listing created:", listing)

# List listings
listings = requests.get(f"{BASE_URL}/listings").json()
print("All listings:", listings)

# Create a booking
booking_payload = {
    "user_id": user["id"],
    "listing_id": listing["id"],
    "start_date": "2025-06-01",
    "end_date": "2025-06-05"
}
booking_response = requests.post(f"{BASE_URL}/bookings", json=booking_payload)
print("Booking created:", booking_response.json())
