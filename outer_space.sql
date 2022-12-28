-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE planets
(
  planet_id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around TEXT NOT NULL,
  galaxy TEXT NOT NULL
);

CREATE TABLE orbitsAround (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE galaxies (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE  moons (
  moon_id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE planet_moons (
  planet_id INT NOT NULL REFERENCES planets,
  moon_id INT REFERENCES moons
);

CREATE TABLE planets_galaxy (
  planet_id INT NOT NULL REFERENCES planets,
  galaxies_id INT NOT NULL REFERENCES galaxies
);

INSERT INTO planets
  (name, orbital_period_in_years, orbits_around, galaxy)
VALUES
  ('Earth', 1.00, 1, 1),
  ('Mars', 1.88, 1, 1),
  ('Venus', 0.62, 1, 1),
  ('Neptune', 164.8, 1, 1),
  ('Proxima Centauri b', 0.03, 2, 1),
  ('Gliese 876 b', 0.23, 3, 1);

INSERT INTO orbitsAround (name) VALUES ('The Sun'), ('Proxima Centauri'), ('Gliese 876');

INSERT INTO galaxies (name) VALUES ('Milky Way');

INSERT INTO moons (name) VALUES ('The Moon'), ('Phobos'), ('Deimos'), ('Naiad'), ('Thalassa'), ('Galatea'), ('Larissa'), ('S/2004 N 1'), ('Proteus'), ('Triton'), ('Nereid'), ('Halimede'), ('Sao'), ('Laomedeia'), ('Psamathe'), ('Neso');

INSERT INTO planet_moons (planet_id, moon_id) VALUES (1, 1), (2, 2), (2, 3), (3, NULL), (4, 4), (4, 5), (4,6), (4,7), (4,8), (4,9), (4,10), (4,11), (4,12), (4,13), (4,14), (4,15), (4,16), (5, NULL), (6, NULL);

INSERT INTO planets_galaxy (planet_id, galaxies_id) VALUES (1, 1), (2, 1), (3, 1), (4,1), (5, 1), (6,1);