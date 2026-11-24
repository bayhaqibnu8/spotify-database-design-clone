# 1. ROW COUNT CHECK (CORE & PIVOT TABLES)
SELECT 'user' AS table_name, COUNT(*) AS total_rows
FROM user
UNION ALL
SELECT 'artist', COUNT(*)
FROM artist
UNION ALL
SELECT 'album', COUNT(*)
FROM album
UNION ALL
SELECT 'playlist_category', COUNT(*)
FROM playlist_category
UNION ALL
SELECT 'podcast_category', COUNT(*)
FROM podcast_category
UNION ALL
SELECT 'song', COUNT(*)
FROM song
UNION ALL
SELECT 'playlist', COUNT(*)
FROM playlist
UNION ALL
SELECT 'podcast', COUNT(*)
FROM podcast
UNION ALL
SELECT 'episode', COUNT(*)
FROM episode
UNION ALL
SELECT 'concert', COUNT(*)
FROM episode
UNION ALL
SELECT 'artist_album', COUNT(*)
FROM artist_album
UNION ALL
SELECT 'artist_song', COUNT(*)
FROM artist_song
UNION ALL
SELECT 'playlist_song', COUNT(*)
FROM playlist_song
UNION ALL
SELECT 'user_artist_follow', COUNT(*)
FROM user_artist_follow
UNION ALL
SELECT 'user_song_like', COUNT(*)
FROM user_song_like
UNION ALL
SELECT 'user_playlist_like', COUNT(*)
FROM user_playlist_like
UNION ALL
SELECT 'artist_concert', COUNT(*)
FROM artist_concert;

# 2. FOREIGN KEY & ORPHAN CHECK (EXPECT: 0 baris/kosong pada setiap orphan check)
-- Verifikasi metadata Foreign Key di spotify_db
SELECT TABLE_NAME,
       COLUMN_NAME,
       CONSTRAINT_NAME,
       REFERENCED_TABLE_NAME,
       REFERENCED_COLUMN_NAME
FROM information_schema.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA = 'spotify_db'
  AND REFERENCED_TABLE_NAME IS NOT NULL
ORDER BY TABLE_NAME, CONSTRAINT_NAME;

-- Cek Orphan Rows pada core dependent tables
SELECT s.id, s.album_id
FROM song AS s
         LEFT JOIN album AS a ON (s.album_id = a.id)
WHERE a.id IS NULL;

SELECT p.id, p.playlist_category_id, p.user_id
FROM playlist p
         LEFT JOIN playlist_category plc ON p.playlist_category_id = plc.id
         LEFT JOIN user u ON p.user_id = u.id
WHERE (p.playlist_category_id IS NOT NULL AND plc.id IS NULL)
   OR u.id IS NULL;

SELECT po.id, po.podcast_category_id, po.user_id
FROM podcast AS po
         LEFT JOIN podcast_category AS poc ON (po.podcast_category_id = poc.id)
         LEFT JOIN user AS u ON (po.user_id = u.id)
WHERE (po.podcast_category_id IS NOT NULL AND poc.id IS NULL)
   OR u.id IS NULL;

SELECT e.id, e.podcast_id
FROM episode AS e
         LEFT JOIN podcast AS po ON (e.podcast_id = po.id)
WHERE po.id IS NULL;

# Cek Orphan Rows pada Pivot Tables
SELECT aa.*
FROM artist_album aa
         LEFT JOIN artist ar ON (aa.artist_id = ar.id)
         LEFT JOIN album al ON (aa.album_id = al.id)
WHERE ar.id IS NULL
  AND al.id IS NULL;

SELECT asg.*
FROM artist_song asg
         LEFT JOIN artist ar ON (asg.artist_id = ar.id)
         LEFT JOIN song s ON (asg.song_id = s.id)
WHERE ar.id IS NULL
  AND s.id IS NULL;

SELECT ps.*
FROM playlist_song ps
         LEFT JOIN playlist pl ON (ps.playlist_id = pl.id)
         LEFT JOIN song s ON (ps.song_id = s.id)
WHERE pl.id IS NULL
  AND s.id IS NULL;

SELECT uaf.*
FROM user_artist_follow as uaf
         LEFT JOIN user u ON (uaf.user_id = u.id)
         LEFT JOIN artist ar ON (uaf.artist_id = ar.id)
WHERE u.id IS NULL
  AND ar.id IS NULL;

SELECT usl.*
FROM user_song_like usl
LEFT JOIN user u ON usl.user_id = u.id
LEFT JOIN song s ON usl.song_id = s.id
WHERE u.id IS NULL OR s.id IS NULL;

SELECT upl.*
FROM user_playlist_like upl
LEFT JOIN user u ON upl.user_id = u.id
LEFT JOIN playlist p ON upl.playlist_id = p.id
WHERE u.id IS NULL OR p.id IS NULL;

SELECT ac.*
FROM artist_concert ac
LEFT JOIN artist ar ON ac.artist_id = ar.id
LEFT JOIN concert c ON ac.concert_id = c.id
WHERE ar.id IS NULL OR c.id IS NULL;

# 3. DUPLICATE CHECK (Ekspekstasi: 0 Baris)
SELECT LOWER(email) AS email_normalized, COUNT(*) AS total
FROM user
GROUP BY LOWER(email)
HAVING COUNT(*) > 1;

SELECT artist_id, album_id, COUNT(*) AS total
FROM artist_album
GROUP BY artist_id, album_id
HAVING COUNT(*) > 1;

SELECT artist_id, song_id, COUNT(*) AS total
FROM artist_song
GROUP BY artist_id, song_id
HAVING COUNT(*) > 1;

SELECT playlist_id, song_id, COUNT(*) AS total
FROM playlist_song
GROUP BY playlist_id, song_id
HAVING COUNT(*) > 1;

SELECT user_id, artist_id, COUNT(*) AS total
FROM user_artist_follow
GROUP BY user_id, artist_id
HAVING COUNT(*) > 1;

SELECT user_id, song_id, COUNT(*) AS total
FROM user_song_like
GROUP BY user_id, song_id
HAVING COUNT(*) > 1;

SELECT user_id, playlist_id, COUNT(*) AS total
FROM user_playlist_like
GROUP BY user_id, playlist_id
HAVING COUNT(*) > 1;

SELECT artist_id, concert_id, COUNT(*) AS total
FROM artist_concert
GROUP BY artist_id, concert_id
HAVING COUNT(*) > 1;

# 4. DOMAIN & BUSINESS RULE CHECK (Ekspektasi: 0 baris)

SELECT id, email, name
FROM user
WHERE email IS NULL OR TRIM(email) = '' OR email NOT LIKE '%@%.%';

SELECT id, name, birthday
FROM user
WHERE birthday IS NOT NULL AND birthday > CURDATE();

SELECT 'song' AS source_table, id, title, duration
FROM song
WHERE duration <= 0
UNION ALL
SELECT 'episode' AS source_table, id, title, duration
FROM episode
WHERE duration <= 0;






