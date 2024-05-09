\set ON_ERROR_STOP on

BEGIN;

CREATE TABLE urls (
    id_urls BIGSERIAL PRIMARY KEY,
    url TEXT UNIQUE
);

CREATE TABLE users (
    id BIGSERIAL PRIMARY KEY,
    username TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL,
    age INTEGER,
    cell VARCHAR(10) UNIQUE NOT NULL
);

CREATE TABLE messages (
    id BIGSERIAL PRIMARY KEY,
    creator_id INTEGER NOT NULL REFERENCES users(id),
    message TEXT NOT NULL,
    time TIMESTAMP NOT NULL DEFAULT current_timestamp
);


CREATE INDEX idX_messages ON messages(time, id, creator_id, message);
CREATE EXTENSION IF NOT EXISTS RUM;
CREATE INDEX idX_search on messages USING RUM(to_tsvector('english', message));

COMMIT;
