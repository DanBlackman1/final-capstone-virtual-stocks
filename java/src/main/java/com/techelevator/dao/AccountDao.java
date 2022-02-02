package com.techelevator.dao;

import com.techelevator.model.Account;
import com.techelevator.model.Game;

import java.util.List;

public interface AccountDao {

    public int createAccount();

    public Account getAccount(int userId, int gameId);

    public List<Account> listAccounts(List<Game> games, int userId);

}
