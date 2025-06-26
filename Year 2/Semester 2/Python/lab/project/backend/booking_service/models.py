import uuid
from datetime import datetime


class Listing:
    def __init__(self, id, price_per_night):
        self.id = id
        self.price_per_night = price_per_night

class User:
    def __init__(self, id, name, email):
        self.id = id
        self.name = name
        self.email = email

class Booking:
    def __init__(self, user_id: str, listing: Listing, start_date: datetime, end_date: datetime, guest_info: dict):
        self.id = str(uuid.uuid4())[:8]
        self.user_id = user_id
        self.listing_id = listing.id
        self.start_date = start_date
        self.end_date = end_date
        self.total_price = self.calculate_price(listing)

        #Guest details
        self.first_name = guest_info.get('first_name')
        self.last_name = guest_info.get('last_name')
        self.home_country = guest_info.get('home_country')
        self.phone_number = guest_info.get('phone_number')
        self.email = guest_info.get('email')
        self.id_type = guest_info.get('id_type')
        self.id_document = guest_info.get('id_document')  
        self.special_requests = guest_info.get('special_requests')

    def calculate_price(self, listing: Listing) -> float:
        nights = (self.end_date - self.start_date).days
        return listing.price_per_night * nights if nights > 0 else 0

    def to_dict(self):
        return {
            "id": self.id,
            "listing_id": self.listing_id,
            "start_date": self.start_date.strftime('%Y-%m-%d'),
            "end_date": self.end_date.strftime('%Y-%m-%d'),
            "total_price": self.total_price,
            "first_name": self.first_name,
            "last_name": self.last_name,
            "home_country": self.home_country,
            "phone_number": self.phone_number,
            "email": self.email,
            "id_type": self.id_type,
            "id_document": self.id_document,
            "special_requests": self.special_requests
        }