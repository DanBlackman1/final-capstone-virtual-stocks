package com.techelevator.dao;

import com.techelevator.model.Account;
import com.techelevator.model.Game;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcAccountDao implements AccountDao{

    private JdbcTemplate template;

    public JdbcAccountDao(DataSource datasource) {
        template = new JdbcTemplate(datasource);
    }

    private Account mapRowToAccount(SqlRowSet rs) {

        Account account = new Account();
        account.setUserBalance(rs.getBigDecimal("user_balance"));
        account.setStockValue(rs.getBigDecimal("stock_value"));
        account.setDollarAmount(rs.getBigDecimal("dollar_amount"));
        account.setGameId(rs.getInt("game_id"));

        return account;
    }

    @Override
    public int createAccount() {
        String sql = "INSERT INTO account (user_balance, stock_value, dollar_amount) " +
                " VALUES (100000, 0, 100000) RETURNING account_id;";
            int id = template.queryForObject(sql, Integer.class);

            return id;
    }

    @Override
    public Account getAccount(int userId, int gameId) {
        Account account = null;
        String sql = "SELECT a.account_id, a.user_balance, a.stock_value, a.dollar_amount, " +
                "gd.game_id AS game_id FROM game_data gd JOIN account a ON a.account_id = gd.account_id WHERE " +
                "gd.game_id = ? AND gd.user_id = ?";
        SqlRowSet results = template.queryForRowSet(sql, gameId, userId);
        account = mapRowToAccount(results);
        return account;
    }

    @Override
    public List<Account> listAccounts(List<Game> games, int userId) {
        List<Account> accountList = new ArrayList<>();
        for(Game userGame : games) {
            Account account = getAccount(userId, userGame.getGameId());
            accountList.add(account);
        }
        return accountList;
    }


}
