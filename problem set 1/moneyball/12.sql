--12.sql
--Hits are great, but so are RBIs! In 12.sql, write a SQL query to find the players among the 10 least expensive players per hit and among the 10 least expensive players per RBI in 2001.

--Your query should return a table with two columns, one for the players’ first names and one of their last names.
--You can calculate a player’s salary per RBI by dividing their 2001 salary by their number of RBIs in 2001.
--You may assume, for simplicity, that a player will only have one salary and one performance in 2001.
--Order your results by player ID, least to greatest (or alphabetically by last name, as both are the same in this case!).
--Keep in mind the lessons you’ve learned in 10.sql and 11.sql!

WITH hit_cost AS (
SELECT
      pf.player_id,
    (s.salary/pf.H) AS dollars_per_hit
    FROM  performances AS pf
    JOIN salaries AS s
    ON pf.player_id = s.player_id
    AND pf.year = s.year
    WHERE pf.year = 2001
    AND pf.H !=0
    ORDER BY dollars_per_hit
    LIMIT 10
    ),
    hit_rbi AS (
        SELECT pf.player_id,
    (s.salary/pf.RBI) AS dollars_per_runs
    FROM performances AS pf
    JOIN salaries AS s
    ON pf.player_id = s.player_id
    AND pf.year = s.year
    WHERE pf.year = 2001
    AND pf.RBI !=0
    ORDER BY dollars_per_runs
    LIMIT 10
    )

    SELECT p.first_name,
    p.last_name FROM  players AS p
    INNER JOIN hit_cost as hc
    ON p.id = hc.player_id
    INNER JOIN hit_rbi as hr
    ON p.id = hr.player_id
    ORDER BY p.id ASC,
    p.first_name, p.last_name ASC;
