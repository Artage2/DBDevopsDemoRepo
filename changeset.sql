--liquibase formatted sql

--changeset public:1
CREATE TABLE test_table (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

--rollback DROP TABLE test_table;

--changeset public:2
INSERT INTO test_table (name) VALUES ('test');

--rollback DELETE FROM test_table WHERE name = 'test';

--changeset public:3
ALTER TABLE test_table ADD COLUMN age INT;

--rollback ALTER TABLE test_table DROP COLUMN age;

--changeset arturas:2
CREATE TABLE person (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    address1 VARCHAR(50),
    address2 VARCHAR(50),
    city VARCHAR(30)
);
--rollback DROP TABLE person;
