BEGIN TRANSACTION;

DROP TABLE IF EXISTS users;
DROP SEQUENCE IF EXISTS seq_user_id;

CREATE TABLE player (
    -- should user_ID be "Serial?"
	user_id serial,
    email varchar(50) NOT NULL,
    username varchar (25) NOT NULL,
    CONSTRAINT PK_user PRIMARY KEY (user_id)
);

CREATE TABLE game (
    game_id int NOT NULL,
    organizer_id int NOT NULL,
    game_name varchar (40) NOT NULL,
    start_date DATE NOT NULL,
    -- CHECK THIS CONSTRAINT IF IT DOESN'T WORK!
    end_date DATE CHECK end_date > start_date NOT NULL,
    CONSTRAINT PK_user PRIMARY KEY (game_id),
    -- May not need below.
    CONSTRAINT FK_game_user FOREIGN KEY organizer_id REFERENCES player(user_id)
);
CREATE TABLE gameData (
    game_id int DEFAULT NOT NULL,
    user_id int DEFAULT NOT NULL,
    account_id int DEFAULt NOT NULL,
    CONSTRAINT PK_gameData PRIMARY KEY (game_id, user_id, account_id),
    CONSTRAINT FK_gameData_accounts FOREIGN KEY (account_id) REFERENCES accounts(account_id),
    CONSTRAINT FK_gameData_player FOREIGN KEY (user_id) REFERENCES player(user_id),
    CONSTRAINT FK_gameData_game FOREIGN KEY (game_id) REFERENCES game(game_id)
);
CREATE TABLE accounts (
    account_id int NOT NULL,
    user_balance int NOT NULL,
    stock_value int,
    dollar_amount int NOT NULL,
    CONSTRAINT PK_accounts PRIMARY KEY (account_id),
    CONSTRAINT FK_accounts_user FOREIGN KEY (account_id) REFERENCES gameData(account_id)
);

	
COMMIT TRANSACTION;
