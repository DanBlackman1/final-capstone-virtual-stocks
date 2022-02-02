package com.techelevator.controller;

import com.techelevator.dao.AccountDao;
import com.techelevator.dao.GameDao;
import com.techelevator.model.Game;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@CrossOrigin
@PreAuthorize("isAuthenticated()")
@RequestMapping ("/myGames")
public class AppController {

    @Autowired
    GameDao gameDao;
    @Autowired
    AccountDao accountDao;

    @RequestMapping(path = "/{id}", method = RequestMethod.GET)
    public List<Game> viewGames(@PathVariable("id") int userId) {
        return gameDao.getGames(userId);
    }

    @RequestMapping(path = "/{id}/createGame", method = RequestMethod.POST)
    public int createGame(@RequestBody Game newGame) {
        return gameDao.saveGame(newGame);
    }

}
