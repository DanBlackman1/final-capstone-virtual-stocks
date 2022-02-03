package com.techelevator.controller;
import com.techelevator.dao.AccountDao;
import com.techelevator.dao.GameDao;
import com.techelevator.dao.StocksDao;
import com.techelevator.model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@CrossOrigin
@PreAuthorize("isAuthenticated()")
@RequestMapping ("/")
public class AppController {

    @Autowired
    GameDao gameDao;
    @Autowired
    AccountDao accountDao;
    @Autowired
    StocksDao stocksDao;

    @RequestMapping(path = "/{id}", method = RequestMethod.GET)
    public ViewGamesResponse viewGames(@PathVariable("id") int userId) {
        ViewGamesResponse viewGamesResponse = new ViewGamesResponse();
        List<Game> gameList = gameDao.getGames(userId);
        List<Account> accountList = accountDao.listAccounts(gameList, userId);
        viewGamesResponse.setGamesList(gameList);
        viewGamesResponse.setAccountsList(accountList);
        return viewGamesResponse;
    }

    @RequestMapping(path = "/{id}", method = RequestMethod.POST)
    public int createGame(@RequestBody Game newGame) {
        int id = accountDao.createAccount();
        return gameDao.saveGame(newGame, id);
    }

    @RequestMapping(path = "/stocks/{userId}/{gameId}", method = RequestMethod.GET)
    public Portfolio getPortfolio(@PathVariable("userId") int userId, @PathVariable("gameId") int gameId) {
        Portfolio portfolio = new Portfolio();
        portfolio.setAccount(accountDao.getAccount(userId, gameId));
        portfolio.setStockList(stocksDao.listStocks(userId, gameId));
        return portfolio;
    }

    @RequestMapping(path = "/stocks/buyNew", method = RequestMethod.POST)
    public void buyNewStock(@RequestBody BuyOrder buyOrder) {
        stocksDao.buyNewStock(buyOrder);
    }

    @RequestMapping(path = "/stocks/buy", method = RequestMethod.PUT)
    public void buyStock(@RequestBody BuyOrder buyOrder) {
        stocksDao.buyExistingStock(buyOrder);
    }



}
