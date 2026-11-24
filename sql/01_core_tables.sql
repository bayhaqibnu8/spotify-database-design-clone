show databases;
select database();
use spotify_db;

SHOW CREATE TABLE song;

CREATE TABLE user
(
    id       VARCHAR(36) NOT NULL PRIMARY KEY,
    email    VARCHAR(50) NOT NULL UNIQUE,
    name     VARCHAR(50) NOT NULL,
    birthday DATE        NULL
) ENGINE = InnoDB;

CREATE TABLE artist
(
    id        VARCHAR(36)  NOT NULL PRIMARY KEY,
    name      VARCHAR(50)  NOT NULL,
    instagram VARCHAR(100) NULL,
    facebook  VARCHAR(100) NULL,
    twitter   VARCHAR(100) NULL,
    wikipedia VARCHAR(100) NULL,
    bio       TEXT         NULL
) ENGINE = InnoDB;

CREATE TABLE album
(
    id         VARCHAR(36)  NOT NULL PRIMARY KEY,
    title      VARCHAR(100) NOT NULL,
    release_at YEAR         NOT NULL,
    image      VARCHAR(100) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE song
(
    id       VARCHAR(36)  NOT NULL PRIMARY KEY,
    album_id VARCHAR(36)  NOT NULL,
    title    VARCHAR(100) NOT NULL,
    duration INT          NOT NULL,
    CONSTRAINT fk_song_album
        FOREIGN KEY (album_id) REFERENCES album (id)
            ON DELETE CASCADE ON UPDATE CASCADE;
) ENGINE = InnoDB;

CREATE TABLE playlist_category
(
    id    VARCHAR(36)  NOT NULL PRIMARY KEY,
    name  VARCHAR(100) NOT NULL,
    image VARCHAR(100) NOT NULL,
    icon  VARCHAR(100) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE playlist
(
    id                   VARCHAR(100) NOT NULL PRIMARY KEY,
    playlist_category_id VARCHAR(36)  NULL,
    user_id              VARCHAR(36)  NOT NULL,
    name                 VARCHAR(100) NOT NULL,
    description          TEXT         NULL,
    image                VARCHAR(100) NULL,
    CONSTRAINT fk_playlist_playlist_category
        FOREIGN KEY (playlist_category_id) REFERENCES playlist_category (id)
            ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT fk_playlist_user
        FOREIGN KEY (user_id) REFERENCES user (id)
            ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB;

CREATE TABLE podcast_category
(
    id    VARCHAR(36)  NOT NULL PRIMARY KEY,
    name  VARCHAR(100) NOT NULL,
    image VARCHAR(100) NOT NULL,
    icon  VARCHAR(100) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE podcast
(
    id                  VARCHAR(36)  NOT NULL PRIMARY KEY,
    name                VARCHAR(100) NOT NULL,
    podcast_category_id VARCHAR(36)  NULL,
    user_id             VARCHAR(36)  NOT NULL,
    image               VARCHAR(100) NULL,
    about               TEXT         NULL,
    CONSTRAINT fk_podcast_podcast_category
        FOREIGN KEY (podcast_category_id) REFERENCES podcast_category (id)
            ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT fk_podcast_user
        FOREIGN KEY (user_id) REFERENCES user (id)
            ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB;


CREATE TABLE episode
(
    id           VARCHAR(36)  NOT NULL PRIMARY KEY,
    podcast_id   VARCHAR(36)  NOT NULL,
    title        VARCHAR(100) NOT NULL,
    description  TEXT         NULL,
    published_at DATE         NOT NULL,
    duration     INT          NOT NULL,
    image        VARCHAR(100) NOT NULL,
    CONSTRAINT fk_episode_podcast
        FOREIGN KEY (podcast_id) REFERENCES podcast (id)
            ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB;

CREATE TABLE concert
(
    id       VARCHAR(36)  NOT NULL PRIMARY KEY,
    location VARCHAR(100) NOT NULL,
    event_at DATETIME     NOT NULL,
    url      VARCHAR(100) NOT NULL,
    lon      DOUBLE       NULL,
    lat      DOUBLE       NULL
) ENGINE = InnoDB;

