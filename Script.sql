
CREATE TABLE Artists (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE Genres (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE Artists_Genres (
    artist_id INTEGER NOT NULL,
    genre_id INTEGER NOT NULL,
    PRIMARY KEY (artist_id, genre_id),
    FOREIGN KEY (artist_id) REFERENCES Artists(id),
    FOREIGN KEY (genre_id) REFERENCES Genres(id)
);

CREATE TABLE Albums (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    release_year INTEGER NOT NULL
);

CREATE TABLE Artists_Albums (
    artist_id INTEGER NOT NULL,
    album_id INTEGER NOT NULL,
    PRIMARY KEY (artist_id, album_id),
    FOREIGN KEY (artist_id) REFERENCES Artists(id),
    FOREIGN KEY (album_id) REFERENCES Albums(id)
);

CREATE TABLE Tracks (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    album_id INTEGER NOT NULL,
    FOREIGN KEY (album_id) REFERENCES Albums(id)
);

CREATE TABLE Playlists (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    release_year INTEGER NOT NULL
);

CREATE TABLE Playlists_Tracks (
    playlist_id INTEGER NOT NULL,
    track_id INTEGER NOT NULL,
    PRIMARY KEY (playlist_id, track_id),
    FOREIGN KEY (playlist_id) REFERENCES Playlists(id),
    FOREIGN KEY (track_id) REFERENCES Tracks(id)
);