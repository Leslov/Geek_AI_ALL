SELECT 
(SELECT nname FROM cities WHERE label = flights.Ffrom) as 'From',
(SELECT nname FROM cities WHERE label = flights.Tto) as 'To'
FROM flights
ORDER BY id;