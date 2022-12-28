DROP DATABASE IF exists soccer_db;
CREATE DATABASE soccer_db;
\c soccer_db;

CREATE TABLE teams (
    team_id SERIAL PRIMARY KEY,
    team_name VARCHAR(10) NOT NULL
);

CREATE TABLE players (
    player_id SERIAL PRIMARY KEY,
    player_name VARCHAR(20) NOT NULL,
    team_id int NOT NULL
);

CREATE TABLE matches (
    match_id SERIAL PRIMARY KEY,
    home_team_id INT NOT NULL,
    away_team_id INT NOT NULL,
    referee_id INT NOT NULL,
    season_id INT NOT NULL
);

CREATE TABLE referees (
    referee_id SERIAL PRIMARY KEY,
    referee_name VARCHAR(20) NOT NULL
);

CREATE TABLE goals (
    id SERIAL PRIMARY KEY,
    player_id INT NOT NULL REFERENCES players,
    team_id INT NOT NULL REFERENCES teams, 
    match_id INT NOT NULL REFERENCES matches  
);

CREATE TABLE season (
    id SERIAL PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

INSERT INTO teams (team_id, team_name) VALUES (1, 'USA'), (2, 'CAN'), (3, 'ARG'), (4, 'POR'), (5, 'POL'), (6, 'GRE');

INSERT INTO players (player_id, player_name, team_id) VALUES (1, 'Lionel Messi', 3), (2, 'Christiano Rinaldo', 4), (3, 'Christian Palesek', 1), (4, 'Alphonso Davies', 2), (5, 'Robert Lewandowski', 5), (6, 'Angelos Charisteas', 6);

INSERT INTO matches (match_id, home_team_id, away_team_id, referee_id, season_id) VALUES (1, 1, 2, 1, 4), (2, 3, 4, 2, 1), (3, 6, 5, 3, 3);

INSERT INTO referees (referee_id, referee_name) VALUES (1, 'Fotis Bazakos'), (2, 'Marcos DeOliveira'), (3, 'Lukasz Szpala');

INSERT INTO goals (id, player_id, team_id, match_id) VALUES (1, 1, 3, 1), (2, 1, 3, 1), (3, 1, 3, 2), (4, 5, 5, 3), (5, 4, 2, 1), (6, 2, 4, 2), (7, 6, 6. 3);

INSERT INTO season (id, start_date, end_date) VALUES (1, '2021-08-13', '2022-05-22'), (2, '2021-08-14', '2022-05-22'), (3, '2021-08-21', '2022-05-22'), (4, '2021-02-28', '2021-10-15');

--1. How many goals did Christian Palesek get?
-- SELECT players.player_name, COUNT(*) AS number_of_goals
-- FROM players
-- JOIN goals
-- ON players.player_id=goals.player_id
-- WHERE players.player_name='Christian Palesek'
-- GROUP BY players.player_name;

--2. Who was the referee when USA was playing CAN?
-- SELECT referees.referee_name
-- FROM referees
-- JOIN matches
-- ON referees.match_id = matches.match_id
-- WHERE team1='USA' AND team2='CAN';

--3. Find the standings/rankings of each team in the league
-- SELECT team_name, COUNT(goals.player_id) AS ranking
-- FROM teams
-- JOIN goals 
-- ON teams.team_id = goals.team_id
-- GROUP BY teams.team_name;




