-- 12.sql
-- A parent asks you for advice on finding the best public school districts in Massachusetts. In 12.sql, write a SQL query to find public school districts with above-average per-pupil expenditures and an above-average percentage of teachers rated “exemplary”. Your query should return the districts’ names, along with their per-pupil expenditures and percentage of teachers rated exemplary. Sort the results first by the percentage of teachers rated exemplary (high to low), then by the per-pupil expenditure (high to low).

SELECT 
  d.name,
  s.exemplary, 
  e.per_pupil_expenditure
FROM 
  districts AS d
INNER JOIN 
  expenditures AS e ON d.id = e.district_id
INNER JOIN  
  staff_evaluations AS s ON
  d.id = s.district_id
WHERE 
  d.type = 'Public School District'
AND 
  e.per_pupil_expenditure > (
    SELECT ROUND(AVG (per_pupil_expenditure),2)
    FROM expenditures)
      AND  s.exemplary > (
        SELECT ROUND(AVG(exemplary),2)
        FROM staff_evaluations)
  ORDER BY 
  s.exemplary DESC, 
  e.per_pupil_expenditure DESC;
