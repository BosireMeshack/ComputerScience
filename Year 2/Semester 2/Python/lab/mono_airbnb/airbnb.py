import uuid
from datetime import datetime
from typing import Optional


class User:
    def __init__(self, name: str, email: str):
        self.id = str(uuid.uuid4())[:8]
        self.name = name
        self.email = email

    def to_dict(self):
        return {
            "id": self.id,
            "name": self.name,
            "email": self.email
        }


class Listing:
    def __init__(self, title: str, description: str, price_per_night: float, location: str, owner_id: str):
        self.id = str(uuid.uuid4())[:8]
        self.title = title
        self.description = description
        self.price_per_night = price_per_night
        self.location = location
        self.owner_id = owner_id

    def to_dict(self):
        return {
            "id": self.id,
            "title": self.title,
            "description": self.description,
            "price_per_night": self.price_per_night,
            "location": self.location,
            "owner_id": self.owner_id
        }


class Booking:
    def __init__(self, user_id: str, listing: Listing, start_date: datetime, end_date: datetime):
        self.id = str(uuid.uuid4())[:8]
        self.user_id = user_id
        self.listing_id = listing.id
        self.start_date = start_date
        self.end_date = end_date
        self.total_price = self.calculate_price(listing)

    def calculate_price(self, listing: Listing) -> float:
        nights = (self.end_date - self.start_date).days
        return listing.price_per_night * nights if nights > 0 else 0

    def to_dict(self):
        return {
            "id": self.id,
            "user_id": self.user_id,
            "listing_id": self.listing_id,
            "start_date": self.start_date.strftime('%Y-%m-%d'),
            "end_date": self.end_date.strftime('%Y-%m-%d'),
            "total_price": self.total_price
        }
