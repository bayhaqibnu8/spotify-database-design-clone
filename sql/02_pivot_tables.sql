select database();

# ----- PIVOT TABLE ------

# Artist -> Album
CREATE TABLE artist_album
(
    artist_id VARCHAR(36) NOT NULL,
    album_id  VARCHAR(36) NOT NULL,

    PRIMARY KEY (artist_id, album_id),

    CONSTRAINT fk_artist_album_artist
        FOREIGN KEY (artist_id) REFERENCES artist (id)
            ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_artist_album_album
        FOREIGN KEY (album_id) REFERENCES album (id)
            ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB;

# Artist -> Song
CREATE TABLE artist_song
(
    artist_id VARCHAR(36) NOT NULL,
    song_id   VARCHAR(36) NOT NULL,

    PRIMARY KEY (artist_id, song_id),

    CONSTRAINT fk_artist_song_artist
        FOREIGN KEY (artist_id) REFERENCES artist (id)
            ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_artist_song_song
        FOREIGN KEY (song_id) REFERENCES song (id)
            ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB;

# Playlist -> Song
CREATE TABLE playlist_song
(
    playlist_id VARCHAR(36) NOT NULL,
    song_id     VARCHAR(36) NOT NULL,

    PRIMARY KEY (playlist_id, song_id),

    CONSTRAINT fk_playlist_song_playlist
        FOREIGN KEY (playlist_id) REFERENCES playlist (id)
            ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_playlist_song_song
        FOREIGN KEY (song_id) REFERENCES song (id)
            ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB;

# User-> Artist (Follow)
CREATE TABLE user_artist_follow
(
    user_id   VARCHAR(36) NOT NULL,
    artist_id VARCHAR(36) NOT NULL,

    PRIMARY KEY (user_id, artist_id),

    CONSTRAINT fk_user_artist_follow_user
        FOREIGN KEY (user_id) REFERENCES user (id)
            ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_user_artist_follow_artist
        FOREIGN KEY (artist_id) REFERENCES artist (id)
            ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB;

# User -> Song (Like)

CREATE TABLE user_song_like
(
    user_id VARCHAR(36) NOT NULL,
    song_id VARCHAR(36) NOT NULL,

    PRIMARY KEY (user_id, song_id),

    CONSTRAINT fk_user_song_like_user
        FOREIGN KEY (user_id) REFERENCES user (id)
            ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_user_song_like_song
        FOREIGN KEY (song_id) REFERENCES song (id)
            ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB;

# User -> Playlist (Like)
CREATE TABLE user_playlist_like
(
    user_id     VARCHAR(36) NOT NULL,
    playlist_id VARCHAR(36) NOT NULL,

    PRIMARY KEY (user_id, playlist_id),

    CONSTRAINT fk_user_playlist_like_user
        FOREIGN KEY (user_id) REFERENCES user (id)
            ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_user_playlist_like_playlist
        FOREIGN KEY (playlist_id) REFERENCES playlist (id)
            ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB;

# Artist -> Concert
CREATE TABLE artist_concert
(
    artist_id  VARCHAR(36) NOT NULL,
    concert_id VARCHAR(36) NOT NULL,

    PRIMARY KEY (artist_id, concert_id),

    CONSTRAINT fk_artist_concert_artist
        FOREIGN KEY (artist_id) REFERENCES artist (id)
            ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_artist_concert_concert
        FOREIGN KEY (concert_id) REFERENCES concert (id)
            ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB;

SHOW TABLES;

