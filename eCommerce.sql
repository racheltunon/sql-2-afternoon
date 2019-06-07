CREATE TABLE Users (
    id SERIAL PRIMARY KEY,
		Name VARCHAR(100),
    Email VARCHAR(100)
);


CREATE TABLE Products (
  	id SERIAL PRIMARY KEY,
		Name VARCHAR(100),
    Price decimal
);


CREATE TABLE Orders (
  	id SERIAL PRIMARY KEY,
		product_id INT REFERENCES Products(id)
);


INSERT INTO Users (Name, Email)
VALUES
	('peter', 'willoughby@gmail.com'),
	('kat', 'katerine@gmail.com'),
	('mark', 'abregotim@gmail.com');

INSERT INTO Products (Name, Price)
VALUES
	('stickers', 21.20),
  ('pens', 1.89),
  ('pencils', 34.95);

#6
INSERT INTO Orders (product_id)
VALUES
  (1),
  (2),
  (3);

#7
SELECT p.Name
FROM Orders o 
JOIN Products p
ON p.id = o.product_id
WHERE o.id = 1;

SELECT * FROM Orders;


SELECT sum(p.price)
FROM Orders o
JOIN Products p
ON p.id = o.product_id
WHERE o.product_id = 1



ALTER TABLE Orders add column user_id integer references Users (id);



UPDATE Orders 
SET user_id = 1
WHERE Orders.id = 1;
 
UPDATE Orders 
SET user_id = 2
WHERE Orders.id = 2;

UPDATE Orders 
SET user_id = 3
WHERE Orders.id = 3;


SELECT  *
FROM Orders 
WHERE user_id = 1;

SELECT u.Name, count(o.id)
FROM Orders o
JOIN Users u
ON u.id = o.user_id
GROUP BY u.Name;