class MusicPlaylist:
    def __init__(self):
        """
        Initialize the playlist as an empty dictionary.
        Key: Track title
        Value: Artist
        """
        self.tracks = {}
    
    def add_track(self, title, artist):
        """
        Add a track to the playlist.
        
        :param title: Title of the track
        :param artist: Name of the artist
        :raises ValueError: If the track is already in the playlist
        """
        if title in self.tracks:
            raise ValueError(f"The track '{title}' by {self.tracks[title]} is already in the playlist.")
        self.tracks[title] = artist
        return f"'{title}' by {artist} added to the playlist."
    
    def remove_track(self, title):
        """
        Remove a track from the playlist.
        
        :param title: Title of the track
        :raises ValueError: If the track is not found in the playlist
        """
        if title not in self.tracks:
            raise ValueError(f"The track '{title}' is not in the playlist.")
        artist = self.tracks.pop(title)
        return f"'{title}' by {artist} removed from the playlist."
    
    def search_track(self, title):
        """
        Search for a track by title in the playlist.
        
        :param title: Title of the track to search
        :return: Artist of the track if found, otherwise None
        """
        return self.tracks.get(title, None)
    
    def play_track(self, title):
        """
        Simulate playing a track.
        
        :param title: Title of the track
        :raises ValueError: If the track is not found in the playlist
        """
        if title not in self.tracks:
            raise ValueError(f"The track '{title}' is not in the playlist.")
        return f"Playing '{title}' by {self.tracks[title]}..."
    
    def list_tracks(self):
        """
        List all tracks in the playlist.
        
        :return: A formatted string of all tracks in the playlist
        """
        if not self.tracks:
            return "The playlist is empty."
        return "\n".join([f"{i + 1}. '{title}' by {artist}" for i, (title, artist) in enumerate(self.tracks.items())])


if(__name__ == "__main__"):
        mp = MusicPlaylist()
        mp.add_track("Alone", "Alan Walker")
        ls = mp.list_tracks()
        print(ls)

