--In 3.sql, choose a location of your own and write a SQL query to find the normal temperature at 0 meters, 100 meters, and 200 meters. You might find Google Earth helpful if you’d like to find some coordinates to use!

SELECT 
  "0" 
FROM 
  "normals"
WHERE 
  "latitude"=62.5 
AND 
  "longitude"=-150.5;
