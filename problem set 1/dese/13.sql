-- 13.sql
-- In 13.sql, write a SQL query to answer a question you have about the data! The query should:
--Involve at least one JOIN or subquery

-- List of top 20 schools having above average rate of graduation rates. 

SELECT 
  s.name, 
  g.graduated
  FROM schools AS s
INNER JOIN 
  graduation_rates AS g ON
  s.id = g.school_id
WHERE 
  g.graduated > (
    SELECT AVG(graduated) FROM graduation_rates
        )
ORDER BY 
  graduated DESC
LIMIT 20;
