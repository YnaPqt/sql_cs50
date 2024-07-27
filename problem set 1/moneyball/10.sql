--10.sql
--The general manager has asked you for a report which details each player’s name, their salary for each year they’ve been playing, and their number of home runs for each year they’ve been playing. To be precise, the table should include:

--All player’s first names
--All player’s last names
--All player’s salaries
--All player’s home runs
--The year in which the player was paid that salary and hit those home runs

SELECT
	p.first_name,
	p.last_name,
	s.salary,
	pf.HR,
	pf.year
FROM performances AS pf
INNER JOIN
	players AS p
	ON pf.player_id =p.id

INNER JOIN
	salaries AS s
	ON p.id = s.player_id
	AND  pf.year = s.year

ORDER BY
	p.id ASC,
	s.year DESC,
	pf.HR DESC,
	s.salary DESC;
