CREATE DATABASE milestone;

USE milestone;

/* membuat table actors */
CREATE TABLE actors (
  id BIGINT PRIMARY KEY,
  username VARCHAR(255),
  password VARCHAR(255),
  role_id INT,
  verified VARCHAR(5) CHECK (verified IN ('true', 'false')),
  active VARCHAR(5) CHECK (active IN ('true', 'false')),
  created_at DATETIME DEFAULT GETDATE(),
  updated_at DATETIME DEFAULT GETDATE()
);
/* membuat table customer */
CREATE TABLE customer (
  id BIGINT PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  email VARCHAR(255),
  avatar VARCHAR(255),
  created_at DATETIME DEFAULT GETDATE(),
  updated_at DATETIME DEFAULT GETDATE()
);

/*membuat tabel role*/
CREATE TABLE [role] (
  id INT PRIMARY KEY,
  role_name VARCHAR(255)
);

/*membuat tabel approval*/
CREATE TABLE register_approval (
  id BIGINT PRIMARY KEY,
  admin_id BIGINT,
  super_admin_id BIGINT,
  status VARCHAR(255)
);


/*edit tabel buat Foreign key ke id*/
ALTER TABLE actors
ADD CONSTRAINT FK_actors_role_id FOREIGN KEY (role_id)
REFERENCES role(id);

SELECT * FROM actors;
SELECT * FROM customer;
SELECT * FROM [role];
SELECT * FROM register_approval;

/*GRANT ALL PRIVILEGES ON milestone.* TO '<username>'@'0.0.0.0' IDENTIFIED BY '<password>';*/

/*mysqldump -u <username> -p milestone > database_schema.sql */

