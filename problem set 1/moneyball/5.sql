--5.sql
--It’s a bit of a slow day in the office. Though Satchel no longer plays, in 5.sql, write a SQL query to find all teams that Satchel Paige played for.

--Your query should return a table with a single column, one for the name of the teams.

SELECT 
  DISTINCT("name") 
  FROM "teams" AS "t"
INNER JOIN 
  "performances" AS "p" ON 
  "t"."id" = "p"."team_id"
INNER JOIN 
  "players" AS "l" ON 
  "p"."player_id" = "l"."id"
WHERE 
  "first_name" = 'Satchel'
AND "last_name" = 'Paige';
