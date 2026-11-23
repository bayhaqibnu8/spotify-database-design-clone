# 1. CORE TABLES - PARENT DATA
INSERT INTO user (id, email, name, birthday)
VALUES ('US-00001', 'andi@gmail.com', 'Andi', '2000-01-15'),
       ('US-00002', 'budi@gmail.com', 'Budi', '1999-05-21'),
       ('US-00003', 'citra@gmail.com', 'Citra', '2001-08-10'),
       ('US-00004', 'dina@gmail.com', 'Dina', '2000-11-03'),
       ('US-00005', 'eko@gmail.com', 'Eko', '1998-03-27'),
       ('US-00006', 'fajar@gmail.com', 'Fajar', '2002-06-14'),
       ('US-00007', 'gita@gmail.com', 'Gita', '2001-02-19'),
       ('US-00008', 'hadi@gmail.com', 'Hadi', '1999-09-25'),
       ('US-00009', 'intan@gmail.com', 'Intan', '2000-12-05'),
       ('US-00010', 'joko@gmail.com', 'Joko', '1998-07-30');

INSERT INTO artist
    (id, name, instagram, facebook, twitter, wikipedia, bio)
VALUES ('AR-00001', 'Aurora Lane', NULL, NULL, NULL, NULL, 'Indie pop singer'),
       ('AR-00002', 'Neon Harbor', NULL, NULL, NULL, NULL, 'Electronic music duo'),
       ('AR-00003', 'Velvet Echo', NULL, NULL, NULL, NULL, 'Alternative rock band'),
       ('AR-00004', 'Mika Sol', NULL, NULL, NULL, NULL, 'R&B singer'),
       ('AR-00005', 'Paper Skies', NULL, NULL, NULL, NULL, 'Acoustic indie band'),
       ('AR-00006', 'Static Bloom', NULL, NULL, NULL, NULL, 'Experimental rock band'),
       ('AR-00007', 'Luna Vale', NULL, NULL, NULL, NULL, 'Dream pop artist'),
       ('AR-00008', 'Golden District', NULL, NULL, NULL, NULL, 'Funk music group'),
       ('AR-00009', 'Riverstone', NULL, NULL, NULL, NULL, 'Folk music artist'),
       ('AR-00010', 'Midnight Theory', NULL, NULL, NULL, NULL, 'Electronic alternative band');

INSERT INTO album (id, title, release_at, image)
VALUES ('AL-00001', 'First Light', 2021, 'first_light.jpg'),
       ('AL-00002', 'Ocean Signals', 2022, 'ocean_signals.jpg'),
       ('AL-00003', 'Broken Patterns', 2020, 'broken_patterns.jpg'),
       ('AL-00004', 'After Hours', 2023, 'after_hours.jpg'),
       ('AL-00005', 'Quiet Places', 2021, 'quiet_places.jpg'),
       ('AL-00006', 'Static Dreams', 2022, 'static_dreams.jpg'),
       ('AL-00007', 'Blue Horizon', 2024, 'blue_horizon.jpg'),
       ('AL-00008', 'Golden Nights', 2020, 'golden_nights.jpg'),
       ('AL-00009', 'Wilderness', 2023, 'wilderness.jpg'),
       ('AL-00010', 'Last Frequency', 2025, 'last_frequency.jpg');

INSERT INTO playlist_category (id, name, image, icon)
VALUES ('PC-00001', 'Pop', 'pop.jpg', 'music'),
       ('PC-00002', 'Rock', 'rock.jpg', 'guitar'),
       ('PC-00003', 'Chill', 'chill.jpg', 'moon'),
       ('PC-00004', 'Workout', 'workout.jpg', 'fitness'),
       ('PC-00005', 'Jazz', 'jazz.jpg', 'saxophone'),
       ('PC-00006', 'Indie', 'indie.jpg', 'headphones'),
       ('PC-00007', 'Electronic', 'electronic.jpg', 'wave'),
       ('PC-00008', 'Acoustic', 'acoustic.jpg', 'guitar'),
       ('PC-00009', 'Focus', 'focus.jpg', 'brain'),
       ('PC-00010', 'Party', 'party.jpg', 'party');

INSERT INTO podcast_category (id, name, image, icon)
VALUES ('PCC-00001', 'Technology', 'technology.jpg', 'computer'),
       ('PCC-00002', 'Education', 'education.jpg', 'book'),
       ('PCC-00003', 'Lifestyle', 'lifestyle.jpg', 'coffee'),
       ('PCC-00004', 'Business', 'business.jpg', 'briefcase'),
       ('PCC-00005', 'Science', 'science.jpg', 'atom'),
       ('PCC-00006', 'Health', 'health.jpg', 'heart'),
       ('PCC-00007', 'History', 'history.jpg', 'clock'),
       ('PCC-00008', 'Entertainment', 'entertainment.jpg', 'film'),
       ('PCC-00009', 'Finance', 'finance.jpg', 'wallet'),
       ('PCC-00010', 'Travel', 'travel.jpg', 'plane');

# 2. CORE TABLES - DEPENDENT DATA
INSERT INTO song (id, album_id, title, duration)
VALUES ('SO-00001', 'AL-00001', 'Morning Light', 210),
       ('SO-00002', 'AL-00002', 'Ocean Drive', 225),
       ('SO-00003', 'AL-00003', 'Falling Apart', 240),
       ('SO-00004', 'AL-00004', 'Midnight Call', 195),
       ('SO-00005', 'AL-00005', 'Quiet Room', 205),
       ('SO-00006', 'AL-00006', 'Static Heart', 230),
       ('SO-00007', 'AL-00007', 'Blue Skies', 215),
       ('SO-00008', 'AL-00008', 'Golden Hour', 245),
       ('SO-00009', 'AL-00009', 'Wild River', 220),
       ('SO-00010', 'AL-00010', 'Last Goodbye', 250);

INSERT INTO playlist
    (id, playlist_category_id, user_id, name, description, image)
VALUES ('PL-00001', 'PC-00001', 'US-00001', 'Morning Playlist', 'Music for the morning', 'morning.jpg'),
       ('PL-00002', 'PC-00002', 'US-00002', 'Rock Essentials', 'Favorite rock songs', 'rock.jpg'),
       ('PL-00003', 'PC-00003', 'US-00003', 'Relaxing Time', 'Songs to relax', 'relax.jpg'),
       ('PL-00004', 'PC-00004', 'US-00004', 'Workout Energy', 'Music for exercise', 'workout.jpg'),
       ('PL-00005', 'PC-00005', 'US-00005', 'Jazz Evening', 'Jazz for the evening', 'jazz.jpg'),
       ('PL-00006', 'PC-00006', 'US-00006', 'Indie Collection', 'Indie favorites', 'indie.jpg'),
       ('PL-00007', 'PC-00007', 'US-00007', 'Electronic Mix', 'Electronic music mix', 'electronic.jpg'),
       ('PL-00008', 'PC-00008', 'US-00008', 'Acoustic Session', 'Acoustic songs', 'acoustic.jpg'),
       ('PL-00009', 'PC-00009', 'US-00009', 'Study Focus', 'Music for studying', 'focus.jpg'),
       ('PL-00010', 'PC-00010', 'US-00010', 'Party Mix', 'Music for parties', 'party.jpg');

INSERT INTO podcast
(id, name, image, about, podcast_category_id, user_id)
VALUES
('PO-00001', 'Tech Talks', 'tech.jpg', 'Technology discussions', 'PCC-00001', 'US-00001'),
('PO-00002', 'Learn Everyday', 'learn.jpg', 'Daily learning topics', 'PCC-00002', 'US-00002'),
('PO-00003', 'Daily Stories', 'stories.jpg', 'Stories about daily life', 'PCC-00003', 'US-00003'),
('PO-00004', 'Business Corner', 'business.jpg', 'Business and entrepreneurship', 'PCC-00004', 'US-00004'),
('PO-00005', 'Science Explained', 'science.jpg', 'Science made simple', 'PCC-00005', 'US-00005'),
('PO-00006', 'Healthy Living', 'health.jpg', 'Health and wellness', 'PCC-00006', 'US-00006'),
('PO-00007', 'History Room', 'history.jpg', 'Historical stories', 'PCC-00007', 'US-00007'),
('PO-00008', 'Movie Talks', 'movie.jpg', 'Movies and entertainment', 'PCC-00008', 'US-00008'),
('PO-00009', 'Money Matters', 'finance.jpg', 'Personal finance topics', 'PCC-00009', 'US-00009'),
('PO-00010', 'Travel Diaries', 'travel.jpg', 'Travel experiences', 'PCC-00010', 'US-00010');

INSERT INTO episode
(id, podcast_id, title, description, published_at, duration, image)
VALUES
('EP-00001', 'PO-00001', 'Introduction to AI', 'Understanding artificial intelligence', '2026-01-01', 1800, 'ai.jpg'),
('EP-00002', 'PO-00002', 'Learning SQL Basics', 'Introduction to SQL', '2026-01-02', 1500, 'sql.jpg'),
('EP-00003', 'PO-00003', 'Building Good Habits', 'How to build positive habits', '2026-01-03', 1200, 'habits.jpg'),
('EP-00004', 'PO-00004', 'Starting a Business', 'Business startup fundamentals', '2026-01-04', 2100, 'startup.jpg'),
('EP-00005', 'PO-00005', 'Exploring Space', 'Discovering outer space', '2026-01-05', 1900, 'space.jpg'),
('EP-00006', 'PO-00006', 'Better Sleep', 'Tips for better sleep', '2026-01-06', 1600, 'sleep.jpg'),
('EP-00007', 'PO-00007', 'Ancient Civilizations', 'Exploring ancient history', '2026-01-07', 2200, 'ancient.jpg'),
('EP-00008', 'PO-00008', 'Film Making Basics', 'Introduction to filmmaking', '2026-01-08', 1700, 'film.jpg'),
('EP-00009', 'PO-00009', 'Saving Money', 'Personal saving strategies', '2026-01-09', 1400, 'saving.jpg'),
('EP-00010', 'PO-00010', 'Travel on a Budget', 'Budget-friendly travel tips', '2026-01-10', 2000, 'budget_travel.jpg');

INSERT INTO concert
(id, location, event_at, url, lon, lat)
VALUES
('CO-00001', 'Jakarta, Indonesia', '2026-12-01 19:00:00', 'https://example.com/event1', 106.8456, -6.2088),
('CO-00002', 'Bandung, Indonesia', '2026-12-02 19:00:00', 'https://example.com/event2', 107.6098, -6.9147),
('CO-00003', 'Surabaya, Indonesia', '2026-12-03 19:00:00', 'https://example.com/event3', 112.7521, -7.2575),
('CO-00004', 'Yogyakarta, Indonesia', '2026-12-04 19:00:00', 'https://example.com/event4', 110.3695, -7.7956),
('CO-00005', 'Semarang, Indonesia', '2026-12-05 19:00:00', 'https://example.com/event5', 110.4203, -6.9667),
('CO-00006', 'Bali, Indonesia', '2026-12-06 19:00:00', 'https://example.com/event6', 115.1889, -8.4095),
('CO-00007', 'Medan, Indonesia', '2026-12-07 19:00:00', 'https://example.com/event7', 98.6722, 3.5952),
('CO-00008', 'Makassar, Indonesia', '2026-12-08 19:00:00', 'https://example.com/event8', 119.4327, -5.1477),
('CO-00009', 'Malang, Indonesia', '2026-12-09 19:00:00', 'https://example.com/event9', 112.6304, -7.9666),
('CO-00010', 'Palembang, Indonesia', '2026-12-10 19:00:00', 'https://example.com/event10', 104.7754, -2.9761);

# 3. PIVOT TABLES - Relationship Data
INSERT INTO artist_album (artist_id, album_id) VALUES
('AR-00001', 'AL-00001'),
('AR-00001', 'AL-00002'),
('AR-00001', 'AL-00003'),
('AR-00002', 'AL-00002'),
('AR-00002', 'AL-00004'),
('AR-00002', 'AL-00005'),
('AR-00003', 'AL-00003'),
('AR-00003', 'AL-00006'),
('AR-00004', 'AL-00004'),
('AR-00004', 'AL-00007'),
('AR-00005', 'AL-00005'),
('AR-00005', 'AL-00008'),
('AR-00006', 'AL-00006'),
('AR-00007', 'AL-00009'),
('AR-00008', 'AL-00010');

INSERT INTO artist_song (artist_id, song_id) VALUES
('AR-00001', 'SO-00001'),
('AR-00001', 'SO-00002'),
('AR-00001', 'SO-00003'),
('AR-00002', 'SO-00002'),
('AR-00002', 'SO-00004'),
('AR-00002', 'SO-00005'),
('AR-00003', 'SO-00003'),
('AR-00003', 'SO-00006'),
('AR-00003', 'SO-00007'),
('AR-00004', 'SO-00004'),
('AR-00004', 'SO-00008'),
('AR-00005', 'SO-00005'),
('AR-00005', 'SO-00009'),
('AR-00006', 'SO-00006'),
('AR-00006', 'SO-00010'),
('AR-00007', 'SO-00007'),
('AR-00008', 'SO-00008'),
('AR-00009', 'SO-00009'),
('AR-00010', 'SO-00010'),
('AR-00010', 'SO-00001');

INSERT INTO playlist_song (playlist_id, song_id) VALUES
-- PL-00001
('PL-00001', 'SO-00001'),
('PL-00001', 'SO-00002'),
('PL-00001', 'SO-00003'),
('PL-00001', 'SO-00004'),

-- PL-00002
('PL-00002', 'SO-00002'),
('PL-00002', 'SO-00003'),
('PL-00002', 'SO-00004'),
('PL-00002', 'SO-00005'),

-- PL-00003
('PL-00003', 'SO-00003'),
('PL-00003', 'SO-00004'),
('PL-00003', 'SO-00005'),
('PL-00003', 'SO-00006'),

-- PL-00004
('PL-00004', 'SO-00004'),
('PL-00004', 'SO-00005'),
('PL-00004', 'SO-00006'),
('PL-00004', 'SO-00007'),

-- PL-00005
('PL-00005', 'SO-00005'),
('PL-00005', 'SO-00006'),
('PL-00005', 'SO-00007'),
('PL-00005', 'SO-00008'),

-- PL-00006
('PL-00006', 'SO-00006'),
('PL-00006', 'SO-00007'),
('PL-00006', 'SO-00008'),
('PL-00006', 'SO-00009'),

-- PL-00007
('PL-00007', 'SO-00007'),
('PL-00007', 'SO-00008'),
('PL-00007', 'SO-00009'),
('PL-00007', 'SO-00010'),

-- PL-00008
('PL-00008', 'SO-00008'),
('PL-00008', 'SO-00009'),
('PL-00008', 'SO-00010'),
('PL-00008', 'SO-00001'),

-- PL-00009
('PL-00009', 'SO-00009'),
('PL-00009', 'SO-00010'),
('PL-00009', 'SO-00001'),
('PL-00009', 'SO-00002'),

-- PL-00010
('PL-00010', 'SO-00010'),
('PL-00010', 'SO-00001'),
('PL-00010', 'SO-00002'),
('PL-00010', 'SO-00003');

INSERT INTO user_artist_follow (user_id, artist_id) VALUES
('US-00001', 'AR-00001'),
('US-00001', 'AR-00002'),
('US-00001', 'AR-00003'),

('US-00002', 'AR-00002'),
('US-00002', 'AR-00003'),
('US-00002', 'AR-00004'),

('US-00003', 'AR-00003'),
('US-00003', 'AR-00004'),
('US-00003', 'AR-00005'),

('US-00004', 'AR-00004'),
('US-00004', 'AR-00005'),
('US-00004', 'AR-00006'),

('US-00005', 'AR-00005'),
('US-00005', 'AR-00006'),
('US-00005', 'AR-00007'),

('US-00006', 'AR-00006'),
('US-00006', 'AR-00007'),
('US-00006', 'AR-00008'),

('US-00007', 'AR-00007'),
('US-00007', 'AR-00008'),
('US-00007', 'AR-00009'),

('US-00008', 'AR-00008'),
('US-00008', 'AR-00009'),
('US-00008', 'AR-00010'),

('US-00009', 'AR-00009'),
('US-00009', 'AR-00010'),
('US-00009', 'AR-00001'),

('US-00010', 'AR-00010'),
('US-00010', 'AR-00001'),
('US-00010', 'AR-00002');

INSERT INTO user_song_like (user_id, song_id) VALUES
('US-00001', 'SO-00001'),
('US-00001', 'SO-00002'),
('US-00001', 'SO-00003'),
('US-00001', 'SO-00004'),

('US-00002', 'SO-00002'),
('US-00002', 'SO-00003'),
('US-00002', 'SO-00004'),
('US-00002', 'SO-00005'),

('US-00003', 'SO-00003'),
('US-00003', 'SO-00004'),
('US-00003', 'SO-00005'),
('US-00003', 'SO-00006'),

('US-00004', 'SO-00004'),
('US-00004', 'SO-00005'),
('US-00004', 'SO-00006'),

('US-00005', 'SO-00005'),
('US-00005', 'SO-00006'),
('US-00005', 'SO-00007'),
('US-00005', 'SO-00008'),

('US-00006', 'SO-00006'),
('US-00006', 'SO-00007'),
('US-00006', 'SO-00008'),

('US-00007', 'SO-00007'),
('US-00007', 'SO-00008'),
('US-00007', 'SO-00009'),
('US-00007', 'SO-00010'),

('US-00008', 'SO-00008'),
('US-00008', 'SO-00009'),
('US-00008', 'SO-00010'),

('US-00009', 'SO-00009'),
('US-00009', 'SO-00010'),
('US-00009', 'SO-00001'),
('US-00009', 'SO-00002'),

('US-00010', 'SO-00010'),
('US-00010', 'SO-00001'),
('US-00010', 'SO-00002');

INSERT INTO user_playlist_like (user_id, playlist_id) VALUES
('US-00001', 'PL-00002'),
('US-00001', 'PL-00003'),
('US-00001', 'PL-00004'),

('US-00002', 'PL-00001'),
('US-00002', 'PL-00003'),
('US-00002', 'PL-00005'),

('US-00003', 'PL-00001'),
('US-00003', 'PL-00004'),
('US-00003', 'PL-00006'),

('US-00004', 'PL-00002'),
('US-00004', 'PL-00005'),
('US-00004', 'PL-00007'),

('US-00005', 'PL-00003'),
('US-00005', 'PL-00006'),
('US-00005', 'PL-00008'),

('US-00006', 'PL-00004'),
('US-00006', 'PL-00007'),
('US-00006', 'PL-00009'),

('US-00007', 'PL-00005'),
('US-00007', 'PL-00008'),
('US-00007', 'PL-00010'),

('US-00008', 'PL-00006'),
('US-00008', 'PL-00009'),

('US-00009', 'PL-00007'),
('US-00010', 'PL-00008');

INSERT INTO artist_concert (artist_id, concert_id) VALUES
('AR-00001', 'CO-00001'),
('AR-00002', 'CO-00001'),

('AR-00002', 'CO-00002'),
('AR-00003', 'CO-00002'),

('AR-00003', 'CO-00003'),
('AR-00004', 'CO-00003'),

('AR-00004', 'CO-00004'),
('AR-00005', 'CO-00004'),

('AR-00005', 'CO-00005'),
('AR-00006', 'CO-00005'),

('AR-00006', 'CO-00006'),
('AR-00007', 'CO-00006'),

('AR-00007', 'CO-00007'),
('AR-00008', 'CO-00008'),
('AR-00009', 'CO-00009');

SELECT 'artist-album' AS table_name, COUNT(*) AS total_table FROM artist_album
UNION ALL
SELECT 'artist_song', COUNT(*) FROM artist_song
UNION ALL
SELECT 'playlist_song', COUNT(*) FROM playlist_song
UNION ALL
SELECT 'user_artist_follow', COUNT(*) FROM user_artist_follow
UNION ALL
SELECT 'user_song_like', COUNT(*) FROM user_song_like
UNION ALL
SELECT 'user_playlist_like', COUNT(*) FROM user_playlist_like
UNION ALL
SELECT 'artist_concert', COUNT(*) FROM artist_concert;
