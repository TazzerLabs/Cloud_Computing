-- Create the DB minibank if it doesn't exist yet via mysql
CREATE DATABASE IF NOT EXISTS minibank DEFAULT CHARACTER SET utf8mb4;

-- use the minibank DB
USE minibank;

-- Create the table account for the minibank
CREATE TABLE IF NOT EXISTS account
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    username CHAR(30) NOT NULL,
    password CHAR(60) NOT NULL,
    timestamp BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(id),
    UNIQUE KEY(username)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Create the user if they don't exist yet and give them all privs
CREATE USER IF NOT EXISTS 'minibank'@'%' IDENTIFIED by 'minibank';
GRANT ALL PRIVILEGES ON minibank.* to 'minibank'@'%';

FLUSH PRIVILEGES;
