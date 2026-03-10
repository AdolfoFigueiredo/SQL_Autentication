CREATE DATABASE IF NOT EXISTS sql_autentication; 
use  sql_autentication;

CREATE TABLE USERS (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

INSERT INTO USERS (name, email, password) VALUES ('Adolfo', 'adolfo@email.com', 'adolfo1234');
INSERT INTO USERS (name, email, password) VALUES ('Abner', 'abner@email.com', 'abner1234');
INSERT INTO USERS (name, email, password) VALUES ('João', 'joao@email.com', 'joao1234');

DELIMITER !!
CREATE PROCEDURE createUser(
    IN userName VARCHAR(255),
    IN userEmail VARCHAR(255),
    IN userPassword VARCHAR(255)
)
BEGIN 

    IF NOT EXISTS (SELECT * FROM USERS WHERE email = userEmail) THEN 
        INSERT INTO USERS (name, email, password) VALUES (userName, userEmail, userPassword);
        SELECT 'usuário criado com sucesso' AS message;
    ELSE 
        SELECT 'Este email já está em uso' AS message;
    END IF;  
END !! 
DELIMITER ; 


DELIMITER !! 
CREATE PROCEDURE autenticateUser(
    IN userEmail VARCHAR(255), 
    IN userPassword VARCHAR(255)
)

BEGIN 
    IF EXISTS (SELECT * FROM USERS WHERE email = userEmail AND password = userPassword) THEN 
        SELECT 'usuário autenticado com sucesso' AS message;
    ELSE 
        SELECT 'Email ou senha incorretos' AS message;
    END IF; 
END !!
DELIMITER ; 