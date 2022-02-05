package com.techelevator.dao;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.techelevator.model.BuyOrder;
import com.techelevator.model.Stock;

import java.util.List;

public interface StocksDao {

    public List<Stock> listStocks(int userId, int gameId);

    public void buyNewStock(BuyOrder buyOrder);

    public void buyExistingStock(BuyOrder buyOrder);

    public List<Stock> listCurrentPricesFromWeb() throws JsonProcessingException;

    public void updateCurrentPrices(List<Stock> stockList);

    public List<Stock> retrieveSavedPrices();

}
