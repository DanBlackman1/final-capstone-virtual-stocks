INSERT INTO users (email,username,password_hash,role) VALUES('user1@mail.com','user1','$2a$10$KZHVTZyyWDKSBlgOfce3xOlWTNqOh7QpOBYAUMWkdn0ey.OEVPGqK','ROLE_USER');
INSERT INTO game (game_name, organizer_id, start_date, end_date) VALUES ('game1', '3', '2022/02/03', '2022/02/18');
INSERT INTO account (user_balance, stock_value, dollar_amount) VALUES ('100000', '0', '100000');
INSERT INTO game_data (user_id, game_id, account_id) VALUES ('3', '1', '1');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('1', 'AAPL', '20');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('1', 'V', '20');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('1', 'CSCO', '25');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('1', 'MSFT', '30');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('1', 'VOD', '50');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('1', 'NVDA', '10');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('1', 'INTC', '90');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('1', 'ORCL', '10');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('1', 'GOOGL', '5');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('1', 'AMZN', '7');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('1', 'TSM', '12');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('1', 'FB', '10');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('1', 'KO', '24');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('1', 'BABA', '10');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('1', 'CVX', '10');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('1', 'JPM', '15');
UPDATE account SET (user_balance, stock_value, dollar_amount) = ('104117.66', '74267.21', '29850.45') WHERE account_id = '1';


INSERT INTO users (email,username,password_hash,role) VALUES('user2@mail.com','user2','$2a$10$dYmNhP4uopZmyyfpBzP7keUnpoj3euKS9H/CVtykOGh3lldbiOqOO','ROLE_USER');
INSERT INTO game (game_name, organizer_id, start_date, end_date) VALUES ('game2', '4', '2022/02/04', '2022/02/12');
INSERT INTO account (user_balance, stock_value, dollar_amount) VALUES ('100000', '0', '100000');
INSERT INTO game_data (user_id, game_id, account_id) VALUES ('4', '2', '2');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('2', 'AAPL', '20');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('2', 'V', '20');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('2', 'CSCO', '25');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('2', 'MSFT', '30');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('2', 'VOD', '50');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('2', 'NVDA', '10');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('2', 'INTC', '90');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('2', 'ORCL', '10');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('2', 'GOOGL', '5');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('2', 'AMZN', '7');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('2', 'TSM', '12');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('2', 'FB', '10');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('2', 'KO', '24');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('2', 'BABA', '10');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('2', 'CVX', '10');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('2', 'JPM', '15');
UPDATE account SET (user_balance, stock_value, dollar_amount) = ('104117.66', '74267.21', '29850.45') WHERE account_id = '2';


INSERT INTO users (email,username,password_hash,role) VALUES('user3@mail.com','user3','$2a$10$C1AMxXI4frc1yT5l.EonpuX7x3TlI87cRnVbe.g84SHJw97o/pTcO','ROLE_USER');
INSERT INTO game (game_name, organizer_id, start_date, end_date) VALUES ('game3', '5', '2022/02/05', '2022/02/13');
INSERT INTO account (user_balance, stock_value, dollar_amount) VALUES ('100000', '0', '100000');
INSERT INTO game_data (user_id, game_id, account_id) VALUES ('5', '3', '3');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('3', 'AAPL', '20');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('3', 'V', '20');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('3', 'CSCO', '25');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('3', 'MSFT', '30');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('3', 'VOD', '50');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('3', 'NVDA', '10');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('3', 'INTC', '90');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('3', 'ORCL', '10');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('3', 'GOOGL', '5');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('3', 'AMZN', '7');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('3', 'TSM', '12');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('3', 'FB', '10');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('3', 'KO', '24');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('3', 'BABA', '10');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('3', 'CVX', '10');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('3', 'JPM', '15');
UPDATE account SET (user_balance, stock_value, dollar_amount) = ('104117.66', '74267.21', '29850.45') WHERE account_id = '3';


INSERT INTO users (email,username,password_hash,role) VALUES('user4@mail.com','user4','$2a$10$M6akkOIpRfGMq3pAZX1fU..JAdAqDaP1nLji3ZhX/Sz5QgmEGYI0q','ROLE_USER');
INSERT INTO game (game_name, organizer_id, start_date, end_date) VALUES ('game4', '6', '2022/02/06', '2022/02/14');
INSERT INTO account (user_balance, stock_value, dollar_amount) VALUES ('100000', '0', '100000');
INSERT INTO game_data (user_id, game_id, account_id) VALUES ('6', '4', '4');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('4', 'AAPL', '20');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('4', 'V', '20');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('4', 'CSCO', '25');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('4', 'MSFT', '30');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('4', 'VOD', '50');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('4', 'NVDA', '10');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('4', 'INTC', '90');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('4', 'ORCL', '10');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('4', 'GOOGL', '5');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('4', 'AMZN', '7');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('4', 'TSM', '12');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('4', 'FB', '10');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('4', 'KO', '24');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('4', 'BABA', '10');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('4', 'CVX', '10');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('4', 'JPM', '15');
UPDATE account SET (user_balance, stock_value, dollar_amount) = ('104117.66', '74267.21', '29850.45') WHERE account_id = '4';

INSERT INTO users (email,username,password_hash,role) VALUES('user5@mail.com','user5','$2a$10$00EgXZjMj7RVp.m1JyeL2enD3p8WJU5BD7PJeWivUxWjRutq2bZg.','ROLE_USER');
INSERT INTO game (game_name, organizer_id, start_date, end_date) VALUES ('game5', '7', '2022/02/07', '2022/02/15');
INSERT INTO account (user_balance, stock_value, dollar_amount) VALUES ('100000', '0', '100000');
INSERT INTO game_data (user_id, game_id, account_id) VALUES ('7', '5', '5');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('5', 'AAPL', '20');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('5', 'V', '20');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('5', 'CSCO', '25');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('5', 'MSFT', '30');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('5', 'VOD', '50');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('5', 'NVDA', '10');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('5', 'INTC', '90');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('5', 'ORCL', '10');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('5', 'GOOGL', '5');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('5', 'AMZN', '7');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('5', 'TSM', '12');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('5', 'FB', '10');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('5', 'KO', '24');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('5', 'BABA', '10');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('5', 'CVX', '10');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('5', 'JPM', '15');
UPDATE account SET (user_balance, stock_value, dollar_amount) = ('104117.66', '74267.21', '29850.45') WHERE account_id = '5';


INSERT INTO account (user_balance, stock_value, dollar_amount) VALUES ('100000', '0', '100000');
INSERT INTO game_data (user_id, game_id, account_id) VALUES ('3', '2', '6');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('6', 'AAPL', '15');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('6', 'V', '18');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('6', 'CSCO', '30');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('6', 'MSFT', '15');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('6', 'VOD', '45');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('6', 'NVDA', '12');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('6', 'INTC', '50');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('6', 'ORCL', '18');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('6', 'GOOGL', '10');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('6', 'AMZN', '7');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('6', 'TSM', '15');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('6', 'FB', '5');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('6', 'KO', '10');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('6', 'BABA', '12');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('6', 'CVX', '10');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('6', 'JPM', '18');
UPDATE account SET (user_balance, stock_value, dollar_amount) = ('106394.90', '80921.92', '25474.45') WHERE account_id = '6';

INSERT INTO account (user_balance, stock_value, dollar_amount) VALUES ('100000', '0', '100000');
INSERT INTO game_data (user_id, game_id, account_id) VALUES ('7', '3', '7');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('7', 'AAPL', '15');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('7', 'V', '18');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('7', 'CSCO', '30');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('7', 'MSFT', '15');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('7', 'VOD', '45');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('7', 'NVDA', '12');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('7', 'INTC', '50');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('7', 'ORCL', '18');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('7', 'GOOGL', '10');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('7', 'AMZN', '7');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('7', 'TSM', '15');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('7', 'FB', '5');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('7', 'KO', '10');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('7', 'BABA', '12');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('7', 'CVX', '10');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('7', 'JPM', '18');
UPDATE account SET (user_balance, stock_value, dollar_amount) = ('106394.90', '80921.92', '25474.45') WHERE account_id = '7';


INSERT INTO account (user_balance, stock_value, dollar_amount) VALUES ('100000', '0', '100000');
INSERT INTO game_data (user_id, game_id, account_id) VALUES ('4', '1', '8');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('8', 'AAPL', '15');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('8', 'V', '18');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('8', 'CSCO', '30');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('8', 'MSFT', '15');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('8', 'VOD', '45');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('8', 'NVDA', '12');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('8', 'INTC', '50');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('8', 'ORCL', '18');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('8', 'GOOGL', '10');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('8', 'AMZN', '7');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('8', 'TSM', '15');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('8', 'FB', '5');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('8', 'KO', '10');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('8', 'BABA', '12');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('8', 'CVX', '10');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('8', 'JPM', '18');
UPDATE account SET (user_balance, stock_value, dollar_amount) = ('108406.90', '80933.92', '27474.45') WHERE account_id = '8';


INSERT INTO account (user_balance, stock_value, dollar_amount) VALUES ('100000', '0', '100000');
INSERT INTO game_data (user_id, game_id, account_id) VALUES ('4', '5', '9');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('9', 'AAPL', '15');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('9', 'V', '18');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('9', 'CSCO', '30');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('9', 'MSFT', '15');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('9', 'VOD', '45');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('9', 'NVDA', '12');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('9', 'INTC', '50');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('9', 'ORCL', '18');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('9', 'GOOGL', '10');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('9', 'AMZN', '7');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('9', 'TSM', '15');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('9', 'FB', '5');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('9', 'KO', '10');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('9', 'BABA', '12');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('9', 'CVX', '10');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('9', 'JPM', '18');
UPDATE account SET (user_balance, stock_value, dollar_amount) = ('106394.90', '80921.92', '25474.45') WHERE account_id = '9';


INSERT INTO account (user_balance, stock_value, dollar_amount) VALUES ('100000', '0', '100000');
INSERT INTO game_data (user_id, game_id, account_id) VALUES ('5', '4', '10');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('10', 'AAPL', '15');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('10', 'V', '18');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('10', 'CSCO', '30');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('10', 'MSFT', '15');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('10', 'VOD', '45');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('10', 'NVDA', '12');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('10', 'INTC', '50');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('10', 'ORCL', '18');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('10', 'GOOGL', '10');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('10', 'AMZN', '7');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('10', 'TSM', '15');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('10', 'FB', '5');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('10', 'KO', '10');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('10', 'BABA', '12');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('10', 'CVX', '10');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('10', 'JPM', '18');
UPDATE account SET (user_balance, stock_value, dollar_amount) = ('106394.90', '80921.92', '25474.45') WHERE account_id = '10';


INSERT INTO account (user_balance, stock_value, dollar_amount) VALUES ('100000', '0', '100000');
INSERT INTO game_data (user_id, game_id, account_id) VALUES ('5', '5', '11');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('11', 'AAPL', '15');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('11', 'V', '36');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('11', 'CSCO', '16');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('11', 'MSFT', '10');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('11', 'VOD', '40');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('11', 'NVDA', '20');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('11', 'INTC', '35');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('11', 'ORCL', '10');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('11', 'GOOGL', '5');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('11', 'AMZN', '10');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('11', 'TSM', '11');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('11', 'FB', '7');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('11', 'KO', '18');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('11', 'BABA', '9');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('11', 'CVX', '13');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('11', 'ADBE', '5');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('11', 'JPM', '10');
UPDATE account SET (user_balance, stock_value, dollar_amount) = ('101576.68', '79985.20', '21586.83') WHERE account_id = '11';

INSERT INTO account (user_balance, stock_value, dollar_amount) VALUES ('100000', '0', '100000');
INSERT INTO game_data (user_id, game_id, account_id) VALUES ('7', '2', '12');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('12', 'AAPL', '7');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('12', 'V', '15');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('12', 'CSCO', '18');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('12', 'MSFT', '30');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('12', 'VOD', '40');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('12', 'NVDA', '10');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('12', 'INTC', '55');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('12', 'ORCL', '10');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('12', 'GOOGL', '5');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('12', 'AMZN', '7');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('12', 'ADBE', '12');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('12', 'FB', '16');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('12', 'KO', '29');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('12', 'BABA', '9');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('12', 'CVX', '13');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('12', 'JPM', '12');
UPDATE account SET (user_balance, stock_value, dollar_amount) = ('100000', '66605.15', '33394.85') WHERE account_id = '12';

INSERT INTO account (user_balance, stock_value, dollar_amount) VALUES ('100000', '0', '100000');
INSERT INTO game_data (user_id, game_id, account_id) VALUES ('3', '3', '13');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('13', 'AAPL', '7');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('13', 'V', '15');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('13', 'CSCO', '18');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('13', 'MSFT', '30');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('13', 'VOD', '40');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('13', 'NVDA', '10');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('13', 'INTC', '55');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('13', 'ORCL', '10');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('13', 'GOOGL', '5');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('13', 'AMZN', '7');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('13', 'ADBE', '12');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('13', 'FB', '16');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('13', 'KO', '29');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('13', 'BABA', '9');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('13', 'CVX', '13');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('13', 'JPM', '12');
UPDATE account SET (user_balance, stock_value, dollar_amount) = ('101000', '66605.15', '34394.85') WHERE account_id = '13';

INSERT INTO account (user_balance, stock_value, dollar_amount) VALUES ('100000', '0', '100000');
INSERT INTO game_data (user_id, game_id, account_id) VALUES ('6', '1', '14');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('14', 'AAPL', '7');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('14', 'V', '15');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('14', 'CSCO', '18');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('14', 'MSFT', '30');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('14', 'VOD', '40');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('14', 'NVDA', '10');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('14', 'INTC', '55');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('14', 'ORCL', '10');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('14', 'GOOGL', '5');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('14', 'AMZN', '7');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('14', 'ADBE', '12');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('14', 'FB', '16');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('14', 'KO', '29');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('14', 'BABA', '9');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('14', 'CVX', '13');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('14', 'JPM', '12');
UPDATE account SET (user_balance, stock_value, dollar_amount) = ('103200.05', '66605.20', '34614.85') WHERE account_id = '14';

INSERT INTO account (user_balance, stock_value, dollar_amount) VALUES ('100000', '0', '100000');
INSERT INTO game_data (user_id, game_id, account_id) VALUES ('6', '2', '15');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('15', 'AAPL', '15');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('15', 'V', '18');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('15', 'CSCO', '30');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('15', 'MSFT', '15');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('15', 'VOD', '45');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('15', 'NVDA', '12');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('15', 'INTC', '50');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('15', 'ORCL', '18');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('15', 'GOOGL', '10');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('15', 'AMZN', '7');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('15', 'TSM', '15');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('15', 'FB', '5');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('15', 'KO', '10');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('15', 'BABA', '12');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('15', 'CVX', '10');
INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES ('15', 'JPM', '18');
UPDATE account SET (user_balance, stock_value, dollar_amount) = ('102394.90', '80921.92', '21474.45') WHERE account_id = '15';


INSERT INTO invite (user_id, game_id, accepted) VALUES ('3', '4', 'false');
INSERT INTO invite (user_id, game_id, accepted) VALUES ('3', '5', 'false');

INSERT INTO invite (user_id, game_id, accepted) VALUES ('4', '3', 'false');
INSERT INTO invite (user_id, game_id, accepted) VALUES ('4', '4', 'false');

INSERT INTO invite (user_id, game_id, accepted) VALUES ('5', '1', 'false');
INSERT INTO invite (user_id, game_id, accepted) VALUES ('5', '2', 'false');

INSERT INTO invite (user_id, game_id, accepted) VALUES ('6', '3', 'false');
INSERT INTO invite (user_id, game_id, accepted) VALUES ('6', '5', 'false');

INSERT INTO invite (user_id, game_id, accepted) VALUES ('7', '4', 'false');
INSERT INTO invite (user_id, game_id, accepted) VALUES ('7', '1', 'false');


INSERT INTO game (game_name, organizer_id, start_date, end_date) VALUES ('First Game', '5', '2022/02/05', '2022/02/09');
INSERT INTO account (user_balance, stock_value, dollar_amount) VALUES ('105087.35', '0', '105087.35');
INSERT INTO game_data (user_id, game_id, account_id) VALUES ('3', '6', '16');
INSERT INTO account (user_balance, stock_value, dollar_amount) VALUES ('110453.89', '0', '110453.89');
INSERT INTO game_data (user_id, game_id, account_id) VALUES ('4', '6', '17');
INSERT INTO account (user_balance, stock_value, dollar_amount) VALUES ('115087.75', '0', '115087.75');
INSERT INTO game_data (user_id, game_id, account_id) VALUES ('5', '6', '18');
INSERT INTO account (user_balance, stock_value, dollar_amount) VALUES ('102087.95', '0', '102087.95');
INSERT INTO game_data (user_id, game_id, account_id) VALUES ('6', '6', '19');
INSERT INTO account (user_balance, stock_value, dollar_amount) VALUES ('108245.65', '0', '108245.65');
INSERT INTO game_data (user_id, game_id, account_id) VALUES ('7', '6', '20');