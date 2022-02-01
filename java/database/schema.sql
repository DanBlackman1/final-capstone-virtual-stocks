BEGIN TRANSACTION;

DROP TABLE IF EXISTS users ;
DROP TABLE IF EXISTS player ;
DROP TABLE IF EXISTS game ;
DROP TABLE IF EXISTS gameData ;
DROP TABLE IF EXISTS accounts ;
DROP SEQUENCE IF EXISTS seq_user_id;

CREATE SEQUENCE seq_user_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;


CREATE TABLE users (
	user_id int DEFAULT nextval('seq_user_id'::regclass) NOT NULL,
	username varchar(50) NOT NULL,
	password_hash varchar(200) NOT NULL,
	role varchar(50) NOT NULL,
	email varchar(50) NOT NULL,
	CONSTRAINT PK_users PRIMARY KEY (user_id)

);

CREATE TABLE game (
    game_id serial,
    organizer_id int NOT NULL,
    game_name varchar (40) NOT NULL,
    start_date DATE NOT NULL,
    -- CHECK THIS CONSTRAINT IF IT DOESN'T WORK!
    end_date DATE,
	--  CHECK end_date > start_date NOT NULL,
    CONSTRAINT PK_game PRIMARY KEY (game_id)
    -- May not need below.
    -- CONSTRAINT FK_game_users FOREIGN KEY organizer_id REFERENCES users(user_id)
);
CREATE TABLE accounts (
    account_id serial,
    user_balance int NOT NULL,
    stock_value int,
    dollar_amount int NOT NULL,
    CONSTRAINT PK_accounts PRIMARY KEY (account_id)
);

CREATE TABLE gameData (
    game_id int  NOT NULL,
    user_id int  NOT NULL,
    account_id int  NOT NULL,
    CONSTRAINT PK_gameData PRIMARY KEY (game_id, user_id, account_id),
    CONSTRAINT FK_gameData_accounts FOREIGN KEY (account_id) REFERENCES accounts(account_id),
    CONSTRAINT FK_gameData_users FOREIGN KEY (user_id) REFERENCES users(user_id),
    CONSTRAINT FK_gameData_game FOREIGN KEY (game_id) REFERENCES game(game_id)
);

-- added above

INSERT INTO users (email,username,password_hash,role) VALUES ('foo@game.com','user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (email,username,password_hash,role) VALUES ('foo@game.com','admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');


COMMIT TRANSACTION;
