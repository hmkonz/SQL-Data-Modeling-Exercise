DROP DATABASE IF exists craigslist_db;
CREATE DATABASE craigslist_db;
\c craigslist_db;

CREATE TABLE regions (
    region_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    user_name VARCHAR(8) NOT NULL,
    preferred_region INT NOT NULL REFERENCES regions 
);

CREATE TABLE posts (
    post_id SERIAL PRIMARY KEY , 
    title TEXT NOT NULL,
    text TEXT NOT NULL,
    location VARCHAR(15) NOT NULL,
    region INT NOT NULL REFERENCES regions
);

CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(20) NOT NULL
);

CREATE TABLE users_posts (
    user_id INT NOT NULL REFERENCES users,
    post_id INT NOT NULL REFERENCES posts
);

CREATE TABLE post_category (
    post_id INT NOT NULL REFERENCES posts,
    category_id INT NOT NULL REFERENCES categories 
);

INSERT INTO regions (region_id, name) VALUES (1, 'MA'), (2, 'Quebec'), (3, 'CO'), (4, 'CA');

INSERT INTO users (user_id, user_name, preferred_region) VALUES (1, 'hmkonz', 1), (2, 'mkonz', 2), (3, 'cckonz', 3), (4, 'pmkonz', 4), (5, 'cnkonz', 1), (6, 'nkonz', 3);

INSERT INTO posts (post_id, title, text, location, region) VALUES (1, 'Winter Tires', 'For Sale $100 each', 'Denver', 3), (2, 'Puppies', 'For Sale $750 each', 'San Francisco', 4), (3, 'Free Furniture', 'Free beds, sofa and rug', 'Montreal', 2), (4, 'Books', 'Text Books for Sale', 'Boston', 1);

INSERT INTO categories (category_id, name) VALUES (1, 'Car Accessories'), (2, 'Pets'), (3, 'Furniture'), (4, 'Tires');

INSERT INTO users_posts VALUES (3, 1), (4, 2), (1, 3), (5, 4);

INSERT INTO post_category (post_id, category_id) VALUES (1, 1), (1, 4), (2, 2), (3,3);


--1. What did user_name 'cnkonz' post?
-- SELECT  user_name, posts.title AS post_title
-- FROM users
-- JOIN users_posts
-- ON users.user_id=users_posts.user_id
-- JOIN posts
-- ON posts.post_id = users_posts.post_id
-- WHERE users.user_name = 'cnkonz';

-- 2. What is the username and category name of the post with title = "Winter Tires"?
-- SELECT users.user_name, categories.name AS category_name
-- FROM users
-- JOIN users_posts
-- ON users.user_id=users_posts.user_id
-- JOIN posts
-- ON posts.post_id = users_posts.post_id
-- JOIN post_category
-- ON posts.post_id=post_category.post_id
-- JOIN categories
-- ON post_category.category_id = categories.category_id
-- WHERE posts.title = 'Winter Tires';
