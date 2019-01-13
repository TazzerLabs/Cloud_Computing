-- Code segements from lab01 in Cloud computing course
  
-- DB: minibank
use minibank;

-- Tables
CREATE TABLE account
(
         id INTEGER NOT NULL AUTO_INCREMENT,
         username CHAR(30) NOT NULL,
         password CHAR(60) NOT NULL,
         timestamp BIGINT UNSIGNED NOT NULL,
         PRIMARY KEY(id),
         UNIQUE KEY(username)
) ENGINE=InnoDB DEFAULT CHARSET=utf9mb4;

-- Create user and grant all privs, then flush
CREATE USER 'minibank'@'%' IDENTIFIED BY 'minibank';
GRANT ALL PRIVILEGES ON minibank.* TO 'minibank'@'%';

FLUSH PRIVILEGES;
