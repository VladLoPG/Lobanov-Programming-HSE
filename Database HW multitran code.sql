CREATE DATABASE multitran;
USE multitran;

CREATE TABLE users(
    user_id INT,
    username VARCHAR(50),
    email VARCHAR(100),
    PRIMARY KEY(user_id)
);

CREATE TABLE languages(
    language_id INT,
    language_name VARCHAR(50),
    pairs_with VARCHAR(100),
    PRIMARY KEY(language_id)
);

CREATE TABLE dictionary_entries(
    entry_id INT,
    item VARCHAR(50),
    part_of_speech VARCHAR(20),
    user_id INT,
    language_id INT,
    comment VARCHAR(200),
    date_added DATE,
    PRIMARY KEY(entry_id),
    CONSTRAINT fk_user_id FOREIGN KEY(user_id) REFERENCES users(user_id),
    CONSTRAINT fk_language_id FOREIGN KEY(language_id) REFERENCES languages(language_id)
);

INSERT INTO users VALUES
(1, 'john_doe', 'john.doe@example.com'),
(2, 'jane_smith', 'jane.smith@example.com'),
(3, 'alex_wong', 'alex.wong@example.com'),
(4, 'maria_garcia', 'maria.garcia@example.com');

INSERT INTO languages VALUES
(1, 'English', 'Spanish'),
(2, 'Spanish', 'English'),
(3, 'French', 'German'),
(4, 'German', 'French'),
(5, 'Russian', 'English');

INSERT INTO dictionary_entries VALUES
(1, 'Hello', 'Interjection', 1, 1, 'Common greeting in English', '1998-03-12'),
(2, 'Hola', 'Interjection', 2, 2, 'Common greeting in Spanish', '2005-07-24'),
(3, 'Bonjour', 'Interjection', 3, 3, 'Common greeting in French', '2010-11-08'),
(4, 'Guten Tag', 'Interjection', 4, 4, 'Common greeting in German', '2013-02-01'),
(5, 'Privet', 'Interjection', 1, 5, 'Common greeting in Russian', '2016-09-15'),
(6, 'Cat', 'Noun', 2, 1, 'A small domesticated carnivorous mammal', '2019-04-27'),
(7, 'Perro', 'Noun', 3, 2, 'Spanish word for dog', '2022-12-05'),
(8, 'Chat', 'Noun', 4, 3, 'French word for cat', '2025-01-18');


SELECT item FROM dictionary_entries
WHERE part_of_speech = 'Interjection';

SELECT username FROM users
WHERE user_id <= 3
ORDER BY username DESC;

SELECT language_name FROM languages
WHERE pairs_with IN ('English', 'Spanish');

SELECT round(avg(YEAR(date_added))) FROM dictionary_entries as avg_year;