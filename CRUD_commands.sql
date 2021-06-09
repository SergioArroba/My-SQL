USE twitter;
SELECT * FROM users;
INSERT INTO users (first_name, last_name, handle, birthday) VALUES ('Sergio', 'Arroba', '@@@', '1987-10-08');
DELETE  FROM users WHERE id = 8;
UPDATE users SET handle = 'BBB' WHERE id = 6;

-- CRUD Commands