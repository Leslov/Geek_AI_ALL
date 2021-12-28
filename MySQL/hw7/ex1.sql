SELECT users.Name FROM users 
INNER JOIN orders ON orders.UserID = users.ID;