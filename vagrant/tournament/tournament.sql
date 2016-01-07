-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.
DROP database tournament;
CREATE database tournament;
\c tournament 
-- DROP TABLE IF EXISTS players;
-- DROP TABLE IF EXISTS matches;            

-- schema 
-- player_id | name

CREATE TABLE players (
	player_id  Serial,
	name varchar(255) NOT NULL,		
	PRIMARY KEY(player_id)

);

-- schema
-- match_id | winner | loser

CREATE TABLE matches (
	match_id Serial,
	winner int references players(player_id) NOT NULL,
	loser int references players(player_id) NOT NULL
);
	

/*CREATE VIEW v_test AS
	SELECT players.player_id, players.name, matches.match_id, matches.winner
	FROM players full outer join matches on players.player_id = matches.match_id
	WHERE players.player_id <= 18
	GROUP BY matches.winner, players.player_id, matches.match_id, players.name;'
*/

CREATE VIEW s_test AS 
	SELECT players.player_id, matches.winner
	FROM players full outer join matches on players.player_id = matches.match_id
	Where matches.winner = players.player_id; 


INSERT INTO players Values(default, 'jake');
INSERT INTO players Values(default, 'jennifer');
INSERT INTO players Values(default, 'shaniqua');
INSERT INTO Matches Values(default, 2, 3);
INSERT INTO Matches Values(default, 1, 2);
INSERT INTO Matches VALUES(default, 2, 3);
INSERT INTO Matches VALUES(default, 2, 3);
INSERT INTO Matches VALUES(default, 1, 3); 
INSERT INTO Matches VALUES(default, 3, 1);







-- players and wins
-- Select players.player_id, count(matches.winner) as wins
-- from players
-- INNER join matches
-- on players.player_id = matches.winner
-- group by players.player_id
-- order by wins DESC;


 -- loser view
Create view losses as 
Select matches.loser
from players, matches
where players.player_id = matches.winner or players.player_id = matches.loser
and matches.winner < matches.winner;

-- select count(*)
-- from matches, players
-- where players.player_id = matches.loser; 


-- Select count(*)
-- from matches
-- group by matches.loser
-- order by matches.loser;

Select play
ers.player_id, players.name, count(matches.winner) as wins
from players
FULL OUTER JOIN matches
on players.player_id = matches.winner
group by players.player_id
order by wins DESC;

