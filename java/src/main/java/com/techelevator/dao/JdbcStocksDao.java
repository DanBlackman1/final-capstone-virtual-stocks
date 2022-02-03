package com.techelevator.dao;

import com.techelevator.model.Account;
import com.techelevator.model.BuyOrder;
import com.techelevator.model.Stock;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcStocksDao implements StocksDao{

    private JdbcTemplate template;

    public JdbcStocksDao(DataSource datasource) {
        template = new JdbcTemplate(datasource);
    }

    @Override
    public List<Stock> listStocks(int userId, int gameId) {
        List<Stock> stockList = new ArrayList<>();
        String sql = "SELECT sa.account_id, sa.stock_symbol, sa.total_shares FROM game_data gd JOIN" +
                " account a ON gd.account_id = a.account_id JOIN stock_amount sa ON a.account_id" +
                " = sa.account_id WHERE gd.user_id = ? AND gd.game_id = ?;";
        SqlRowSet results = template.queryForRowSet(sql, userId, gameId);
        while(results.next()) {
            Stock stock = mapRowToStock(results);
            stockList.add(stock);
        }
        return stockList;
    }

    @Override
    public void buyNewStock(BuyOrder buyOrder) {
        String sql = "INSERT INTO stock_amount (account_id, stock_symbol, total_shares) VALUES (?, ?, ?);";
        template.update(sql, buyOrder.getAccountId(), buyOrder.getStockSymbol(), buyOrder.getSharesToAdd());
    }

    @Override
    public void buyExistingStock(BuyOrder buyOrder) {
        String sql = "UPDATE stock_amount SET total_shares = total_shares + ? WHERE account_id = ? AND stock_symbol = ?;";
        template.update(sql, buyOrder.getSharesToAdd(), buyOrder.getAccountId());
    }

    private Stock mapRowToStock(SqlRowSet results) {

        Stock stock = new Stock();
        stock.setAccountId(results.getInt("account_id"));
        stock.setNumberOfShares(results.getInt("total_shares"));
        stock.setStockSymbol(results.getString("stock_symbol"));

        return stock;
    }
}
