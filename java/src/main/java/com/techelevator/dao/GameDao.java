package com.techelevator.dao;

import com.techelevator.model.Game;

import java.util.List;

public interface GameDao {


    public List<Game> getGames(int userId);

    public Game getGame(int gameId);

    public void saveGame(Game gameToSave);

//    public void removeGame(int gameId);

    public void endGame(int gameId);

//    public void editGame(Game gameToSave);

    public void addUser(int gameId, int userId);

}
