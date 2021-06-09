  
--  Devuelva una lista de usuarios junto con los nombres de sus amigos.
SELECT users.first_name, users.last_name, user2.first_name AS firend_first_name, user2.last_name AS friend_last_name
FROM users
JOIN friendships ON users.id = user_id
JOIN users AS user2 ON user2.id = friend_id;
-- 1.-
SELECT CONCAT(users.first_name," ",users.last_name) AS Friends
FROM users
JOIN friendships ON users.id = user_id
WHERE friendships.friend_id = 4;
-- 2.-
SELECT COUNT(id) AS todas_las_amistades FROM friendships;
-- 3.- 
SELECT COUNT(user_id) FROM friendships WHERE user_id = 1;
-- 4.- 
INSER INTO users (first_name,last_name) VALUES("Miss","Piggie");
INSER INTO friendships (user_id,friend_id) VALUES(6,2);
INSER INTO friendships (user_id,friend_id) VALUES(6,4);
INSER INTO friendships (user_id,friend_id) VALUES(6,5);
-- 5.-
SELECT CONCAT(users.first_name," ",users.last_name) AS Amigos 
FROM users
JOIN friendships ON users.id = user_id
WHERE friend_id = 2 ORDER BY Amigos ASC;
-- 6.- 
DELETE FROM friendships WHERE friend_id = 5 AND user_id = 2;
-- 7.-
SELECT users.first_name, users.last_name
FROM users
JOIN friendships ON users.id = user_id;