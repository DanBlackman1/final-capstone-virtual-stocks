package com.techelevator.model;

import java.math.BigDecimal;

public class BuyOrder {

    private int sharesToAdd;
    private String stockSymbol;
    private int accountId;
   // private boolean isOwned;
    private BigDecimal cost;

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

    public BigDecimal getCost() {
        return cost;
    }

    public void setCost(BigDecimal cost) {
        this.cost = cost;
    }

    //  public boolean isOwned() {
  //      return isOwned;
 //   }

   // public void setOwned(boolean owned) {
   //     isOwned = owned;
  //  }
}
