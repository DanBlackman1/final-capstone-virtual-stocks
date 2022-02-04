BEGIN TRANSACTION;

DROP TABLE IF EXISTS users ;
DROP TABLE IF EXISTS game ;
DROP TABLE IF EXISTS game_data ;
DROP TABLE IF EXISTS account ;
DROP TABLE IF EXISTS stock_amount ;
DROP TABLE IF EXISTS stock_values ;
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
CREATE TABLE account (
    account_id serial,
    user_balance DECIMAL(19,2) NOT NULL,
    stock_value DECIMAL(19,2),
    dollar_amount DECIMAL(19,2) NOT NULL,
    CONSTRAINT PK_account PRIMARY KEY (account_id)
);

CREATE TABLE game_data (
    game_id int  NOT NULL,
    user_id int  NOT NULL,
    account_id int  NOT NULL,
    CONSTRAINT PK_game_data PRIMARY KEY (game_id, user_id, account_id),
    CONSTRAINT FK_game_data_account FOREIGN KEY (account_id) REFERENCES account(account_id),
    CONSTRAINT FK_game_data_users FOREIGN KEY (user_id) REFERENCES users(user_id),
    CONSTRAINT FK_game_data_game FOREIGN KEY (game_id) REFERENCES game(game_id)
);

CREATE TABLE stock_price (
    stock_symbol varchar(10) NOT NULL,
    stock_price DECIMAL(19,2) NOT NULL,
    CONSTRAINT PK_stock_price PRIMARY KEY (stock_symbol)

);

CREATE TABLE stock_amount (
    account_id int NOT NULL,
    stock_symbol varchar(10) NOT NULL,
    total_shares DECIMAL(19,2) NOT NULL,
    CONSTRAINT FK_stock_amount_account FOREIGN KEY (account_id) REFERENCES account(account_id),
    CONSTRAINT FK_stock_amount_stock_symbol FOREIGN KEY (stock_symbol) REFERENCES stock_price(stock_symbol)
);


-- added above

INSERT INTO users (email,username,password_hash,role) VALUES ('foo@game.com','user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (email,username,password_hash,role) VALUES ('foo@game.com','admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');


COMMIT TRANSACTION;
