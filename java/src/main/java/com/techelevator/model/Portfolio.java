package com.techelevator.model;

import java.util.List;

public class Portfolio {

    private List<Stock> stockList;
    private Account account;

    public List<Stock> getStockList() {
        return stockList;
    }

    public void setStockList(List<Stock> stockList) {
        this.stockList = stockList;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }
}
