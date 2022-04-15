-- Exercise 1 (done for you):
SELECT * FROM users;



-- Exercise 2 (done for you):
SELECT id, first_name, last_name 
FROM users;



-- Exercise 3
SELECT id, first_name, last_name
FROM users
ORDER BY last_name;



-- Exercise 4
SELECT id, user_id, image_url
FROM posts
WHERE user_id = 26;



-- Exercise 5
SELECT id, user_id, image_url
FROM posts
WHERE user_id in (12,26);



-- Exercise 6
SELECT COUNT(*) 
FROM posts;



-- Exercise 7
SELECT user_id, COUNT(*)
FROM comments
GROUP BY user_id
ORDER BY COUNT(*) desc;



-- Exercise 8
SELECT posts.id, user_id, image_url, username, users.first_name, last_name
FROM posts
INNER JOIN users 
ON users.id = posts.user_id
WHERE posts.user_id in (12,26);



-- Exercise 9
SELECT posts.id, posts.pub_date, following.following_id
FROM posts
INNER JOIN following
ON posts.user_id = following.following_id
WHERE following.user_id = 26;



-- Exercise 10
SELECT posts.id, pub_date, following.following_id, users.username
FROM posts
INNER JOIN following
ON posts.user_id = following.following_id
INNER JOIN users
ON posts.user_id = users.id
WHERE following.user_id = 26
ORDER BY pub_date desc;



-- Exercise 11
INSERT INTO bookmarks(user_id, post_id, timestamp)
VALUES (26, 219, now());
INSERT INTO bookmarks(user_id, post_id, timestamp)
VALUES (26, 220, now());
INSERT INTO bookmarks(user_id, post_id, timestamp)
VALUES (26, 221, now());



-- Exercise 12
DELETE FROM bookmarks
WHERE post_id in (219,220,221);



-- Exercise 13
UPDATE users
SET email = 'knick2022@gmail.com'
WHERE id = 26;



-- Exercise 14
SELECT posts.id, posts.user_id, posts.caption, COUNT(comments.id)
FROM posts
INNER JOIN comments ON comments.post_id = posts.id
WHERE posts.user_id = 26
GROUP BY posts.id;

-- A Join is a function to join two tables on some common conditions between the tables. 
-- The common condition could be a similar + same column name or it could be similar values.

-- It's a good idea to have a foreign key for UserID in the posts table because the relationship
-- between Users and posts is one-to-many. This means that if you included username, first name,
-- and last name in the posts table, you'd have a lot of redundant information if users make 
-- multiple posts. Instead, we use a foreign key to identify which user made the post, from which 
-- we can go to the users table to look up corresponding information.