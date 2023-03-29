CREATE KEYSPACE IF NOT EXISTS sample_keyspace
WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 1};

USE sample_keyspace;

CREATE TABLE IF NOT EXISTS users (
    id UUID PRIMARY KEY,
    name TEXT,
    age INT,
    email TEXT
);

INSERT INTO users (id, name, age, email) VALUES (uuid(), 'Alice', 30, 'alice@example.com');
INSERT INTO users (id, name, age, email) VALUES (uuid(), 'Bob', 25, 'bob@example.com');
INSERT INTO users (id, name, age, email) VALUES (uuid(), 'Charlie', 22, 'charlie@example.com');
INSERT INTO users (id, name, age, email) VALUES (uuid(), 'David', 29, 'david@example.com');
INSERT INTO users (id, name, age, email) VALUES (uuid(), 'Eva', 35, 'eva@example.com');
INSERT INTO users (id, name, age, email) VALUES (uuid(), 'Frank', 28, 'frank@example.com');
INSERT INTO users (id, name, age, email) VALUES (uuid(), 'Grace', 32, 'grace@example.com');
INSERT INTO users (id, name, age, email) VALUES (uuid(), 'Hannah', 24, 'hannah@example.com');
INSERT INTO users (id, name, age, email) VALUES (uuid(), 'Ivan', 27, 'ivan@example.com');
INSERT INTO users (id, name, age, email) VALUES (uuid(), 'Jack', 31, 'jack@example.com');

INSERT INTO users (id, name, age, email) VALUES (uuid(), 'Alice', 30, 'alice@example.com');
INSERT INTO users (id, name, age, email) VALUES (uuid(), 'Bob', 25, 'bob@example.com');
INSERT INTO users (id, name, age, email) VALUES (uuid(), 'Charlie', 22, 'charlie@example.com');
INSERT INTO users (id, name, age, email) VALUES (uuid(), 'David', 29, 'david@example.com');
INSERT INTO users (id, name, age, email) VALUES (uuid(), 'Eva', 35, 'eva@example.com');
INSERT INTO users (id, name, age, email) VALUES (uuid(), 'Frank', 28, 'frank@example.com');
INSERT INTO users (id, name, age, email) VALUES (uuid(), 'Grace', 32, 'grace@example.com');
INSERT INTO users (id, name, age, email) VALUES (uuid(), 'Hannah', 24, 'hannah@example.com');
INSERT INTO users (id, name, age, email) VALUES (uuid(), 'Ivan', 27, 'ivan@example.com');
INSERT INTO users (id, name, age, email) VALUES (uuid(), 'Jack', 31, 'jack@example.com');