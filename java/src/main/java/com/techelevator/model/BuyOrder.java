package com.techelevator.model;

import java.math.BigDecimal;

public class BuyOrder {

    private int sharesToAdd;
    private String stockSymbol;
    private int accountId;
    private BigDecimal currentPrice;
   // private boolean isOwned;

    public int getSharesToAdd() {
        return sharesToAdd;
    }

    public void setSharesToAdd(int sharesToAdd) {
        this.sharesToAdd = sharesToAdd;
    }

    public String getStockSymbol() {
        return stockSymbol;
    }

    public void setStockSymbol(String stockSymbol) {
        this.stockSymbol = stockSymbol;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public BigDecimal getCurrentPrice() {
        return currentPrice;
    }

    public void setCurrentPrice(BigDecimal currentPrice) {
        this.currentPrice = currentPrice;
    }

    //  public boolean isOwned() {
  //      return isOwned;
 //   }

   // public void setOwned(boolean owned) {
   //     isOwned = owned;
  //  }
}
