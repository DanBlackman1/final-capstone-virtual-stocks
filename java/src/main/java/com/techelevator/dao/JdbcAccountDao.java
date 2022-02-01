package com.techelevator.dao;

import com.techelevator.model.Account;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
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

        return account;
    }

    @Override
    public int createAccount() {
        String sql = "INSERT INTO account (user_balance, stock_value, dollar_amount) " +
                " VALUES (100000, 0, 100000) RETURNING account_id;";
            int id = template.queryForObject(sql, Integer.class);

            return id;
    }
}
