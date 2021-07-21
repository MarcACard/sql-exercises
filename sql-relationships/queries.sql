-- Exercise # 1
/* Join the two tables so that every column and record appears */
SELECT * 
  FROM vehicles v
  FULL OUTER JOIN owners s 
  ON v.owner_id = s.id;

-- Exercise # 2
/* Count the number of cars for each owner. 
Display the owners first_name, last_name and count of vehicles. 
The first_name should be ordered in ascending order.*/

SELECT o.first_name, o.last_name, count(*)
  FROM vehicles v
  JOIN owners o
  ON v.owner_id = o.id
  GROUP BY o.id
  ORDER BY count ASC;

-- Exercise #3
/* Count the number of cars for each owner and display the average price for each of the cars as integers. 
Display the owners first_name, last_name, average price and count of vehicles.
The first_name should be ordered in descending order. 
Only display results with more than one vehicle and an average price greater than 10000.
*/

SELECT o.first_name, o.last_name, ROUND(AVG(v.price)) as avg_price, COUNT(v.id)
  FROM vehicles v
  JOIN owners o
  ON v.owner_id = o.id
  GROUP BY o.id
  HAVING AVG(v.price) > 10000 AND COUNT(v.id) > 1
  ORDER BY o.first_name DESC;