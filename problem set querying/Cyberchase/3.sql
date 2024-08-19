--In 3.sql, find the production code for the episode “Hackerized!”.
SELECT 
  "title" 
FROM 
  "episodes"
WHERE 
  "topic" is NULL;
