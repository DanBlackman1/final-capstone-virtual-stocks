INSERT INTO users (email,username,password_hash,role) VALUES('user1@mail.com','user1','$2a$10$KZHVTZyyWDKSBlgOfce3xOlWTNqOh7QpOBYAUMWkdn0ey.OEVPGqK','ROLE_USER');
INSERT INTO game (game_name, organizer_id, start_date, end_date) VALUES ('game1', '3', '2022/02/03', '2022/02/11');
INSERT INTO account (user_balance, stock_value, dollar_amount) VALUES ('100000', '0', '100000');
INSERT INTO game_data (user_id, game_id, account_id) VALUES ('3', '1', '1');
--INSERT INTO stock_price (stock_symbol,stock_price) VALUES ('AMZN', '3200.00');
--INSERT INTO stock_price (stock_symbol,stock_price) VALUES ('AAPL', '175.00');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('1', 'AAPL', '10');

INSERT INTO users (email,username,password_hash,role) VALUES('user2@mail.com','user2','$2a$10$dYmNhP4uopZmyyfpBzP7keUnpoj3euKS9H/CVtykOGh3lldbiOqOO','ROLE_USER');
INSERT INTO game (game_name, organizer_id, start_date, end_date) VALUES ('game2', '4', '2022/02/04', '2022/02/12');
INSERT INTO account (user_balance, stock_value, dollar_amount) VALUES ('100000', '0', '100000');
INSERT INTO game_data (user_id, game_id, account_id) VALUES ('4', '2', '2');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('2', 'AMZN', '2');


INSERT INTO users (email,username,password_hash,role) VALUES('user3@mail.com','user3','$2a$10$C1AMxXI4frc1yT5l.EonpuX7x3TlI87cRnVbe.g84SHJw97o/pTcO','ROLE_USER');
INSERT INTO game (game_name, organizer_id, start_date, end_date) VALUES ('game3', '5', '2022/02/05', '2022/02/13');
INSERT INTO account (user_balance, stock_value, dollar_amount) VALUES ('100000', '0', '100000');
INSERT INTO game_data (user_id, game_id, account_id) VALUES ('5', '3', '3');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('3', 'AAPL', '15');

INSERT INTO users (email,username,password_hash,role) VALUES('user4@mail.com','user4','$2a$10$M6akkOIpRfGMq3pAZX1fU..JAdAqDaP1nLji3ZhX/Sz5QgmEGYI0q','ROLE_USER');
INSERT INTO game (game_name, organizer_id, start_date, end_date) VALUES ('game4', '6', '2022/02/06', '2022/02/14');
INSERT INTO account (user_balance, stock_value, dollar_amount) VALUES ('100000', '0', '100000');
INSERT INTO game_data (user_id, game_id, account_id) VALUES ('6', '4', '4');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('4', 'AMZN', '5');

INSERT INTO users (email,username,password_hash,role) VALUES('user5@mail.com','user5','$2a$10$00EgXZjMj7RVp.m1JyeL2enD3p8WJU5BD7PJeWivUxWjRutq2bZg.','ROLE_USER');
INSERT INTO game (game_name, organizer_id, start_date, end_date) VALUES ('game5', '7', '2022/02/07', '2022/02/15');
INSERT INTO account (user_balance, stock_value, dollar_amount) VALUES ('100000', '0', '100000');
INSERT INTO game_data (user_id, game_id, account_id) VALUES ('7', '5', '5');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('5', 'AAPL', '5');
