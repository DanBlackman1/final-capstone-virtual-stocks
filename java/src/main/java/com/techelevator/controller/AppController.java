package com.techelevator.controller;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.techelevator.dao.AccountDao;
import com.techelevator.dao.GameDao;
import com.techelevator.dao.InviteDao;
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
    @Autowired
    InviteDao inviteDao;

    // CHECK ABOUT PATHS AND WHETHER BEST PRACTICE

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

    @RequestMapping(path = "/portfolio/{id}", method = RequestMethod.GET)
    public Portfolio getPortfolio(@PathVariable("id") int accountId) {
        Portfolio portfolio = new Portfolio();
        portfolio.setStockList(stocksDao.listStocks(accountId));
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

    @RequestMapping(path = "/currentPrices", method = RequestMethod.GET)
    public List<Stock> getAndUpdateStockData() throws JsonProcessingException {
        List<Stock> pricesList = stocksDao.listCurrentPricesFromWeb();
        if (pricesList.size() > 0) {
            stocksDao.updateCurrentPrices(pricesList);
            List<Integer> accountIdList = accountDao.getActiveAccounts();
            stocksDao.updateStockValue(accountIdList, pricesList);
        }
        return stocksDao.retrieveSavedPrices();
    }

    @RequestMapping(path = "/leaderboard/{id}", method = RequestMethod.GET)
    public List<Account> getLeaderboard(@PathVariable("id") int gameId) {
        return accountDao.getAccountsWithinGame(gameId);
    }

    @RequestMapping(path = "/invite", method = RequestMethod.POST)
    public void invitePlayer(@RequestBody Invite invite) {
        inviteDao.invitePlayer(invite.getUserId(), invite.getUserId());
    }

    @RequestMapping(path = "/displayUsers/{gameId}", method = RequestMethod.GET)
    public List<User> displayUsers(@PathVariable("gameId") int gameId) {
        return inviteDao.displayUsers(gameId);
    }

    @RequestMapping(path = "/confirm", method = RequestMethod.PUT)
    public void confirmInvite(@RequestBody Invite invite) {
        inviteDao.confirmInvite(invite.getUserId(), invite.getGameId());
    }





}
