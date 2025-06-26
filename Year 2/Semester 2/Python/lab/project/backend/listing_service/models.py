import uuid

class Listing:
    def __init__(self, title: str, description: str, price_per_night: float, location: str, owner_id: str, bedrooms: int, bathrooms: int, parking: bool, image: str, gallery: list, reviews: int,
                 features: list, map_link: str, video: str):
        self.id = str(uuid.uuid4())[:8]
        self.title = title
        self.description = description
        self.price_per_night = price_per_night
        self.location = location
        self.owner_id = owner_id
        self.bedrooms = bedrooms
        self.bathrooms = bathrooms
        self.parking = parking
        self.image = image
        self.gallery = gallery
        self.reviews = reviews
        self.features = features
        self.map_link = map_link
        self.video = video

    def to_dict(self):
        return {
            "id": self.id,
            "title": self.title,
            "description": self.description,
            "price_per_night": self.price_per_night,
            "location": self.location,
            "owner_id": self.owner_id,
            "bedrooms": self.bedrooms,
            "bathrooms": self.bathrooms,
            "parking": self.parking,
            "image": self.image,
            "gallery": self.gallery,
            "reviews": self.reviews,
            "features": self.features,
            "mapLink": self.map_link,
            "video": self.video
        }

