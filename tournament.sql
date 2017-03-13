-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.

CREATE TABLE player (
	id SERIAL PRIMARY KEY,
	name TEXT NOT NULL);

CREATE TABLE match (
	id SERIAL PRIMARY KEY,
	winner INT NOT NULL references player(id),
	losser INT NOT NULL references player(id));

CREATE VIEW winnerCount AS SELECT player.id, player.name, count(match.winner) AS winner 
	FROM player LEFT JOIN match ON player.id = match.winner 
	GROUP BY player.id ORDER BY winner;

CREATE VIEW matchCount AS SELECT player.id, count(match.winner) AS matches
 FROM player LEFT JOIN match ON player.id = match.winner OR  player.id = match.losser 
 GROUP BY player.id;
