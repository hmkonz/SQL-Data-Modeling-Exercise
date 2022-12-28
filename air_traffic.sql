-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  name INT NOT NULL,
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline INT NOT NULL,
  from_city INT NOT NULL,
  from_country INT NOT NULL,
  to_city INT NOT NULL,
  to_country INT NOT NULL
);

CREATE TABLE passenger (
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE airlines (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE fromCity (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE departureCountry (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE toCity (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE arrivalCountry (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

INSERT INTO tickets
  (name, seat, departure, arrival, airline, from_city, from_country, to_city, to_country)
VALUES
  (1, '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 1, 1, 1, 1),
  (2, '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 2, 2, 2, 2, 2),
  (3, '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 3, 3, 1, 3, 1),
  (1, '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 3, 4, 1, 4, 3),
  (4, '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 4, 5, 3, 5, 4),
  (2, '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 5, 6, 4, 6, 5),
  (5, '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 1, 7, 1, 7, 1),
  (6, '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 6, 8, 1, 8, 1),
  (5, '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 6, 9, 1, 9, 1),
  (7, '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 7, 10, 5, 10, 6);

  INSERT INTO passenger (first_name, last_name) VALUES ('Jennifer', 'Finch'), ('Thadeus', 'Gathercoal'), ('Sonja', 'Pauley'), ('Waneta', 'Skeleton'), ('Berkie', 'Wycliff'), ('Alvin', 'Leathes'), ('Cory', 'Squibbes');

  INSERT INTO airlines (name) VALUES ('United'), ('British Airways'), ('Delta'), ('TUI Fly Belgium'), ('Air China'), ('American Airlines'), ('Avianca Brasil');

  INSERT INTO fromCity (name) VALUES ('Washington DC'), ('Tokyo'), ('Los Angeles'), ('Seattle'), ('Paris'), ('Dubai'), ('New York'), ('Cedar Rapids'), ('Charlotte'), ('Sao Paolo');

  INSERT INTO departureCountry (name) VALUES ('United States'), ('Japan'), ('France'), ('UAE'), ('Brazil');

  INSERT INTO toCity (name) VALUES ('Seattle'), ('London'), ('Las Vegas'), ('Mexico City'), ('Casablanca'), ('Beijing'), ('Charlotte'), ('Chicago'), ('New Orleans'), ('Santiago');

  INSERT INTO arrivalCountry (name) VALUES ('United States'), ('United Kingdom'), ('Mexico'), ('Morocco'), ('China'), ('Chile');