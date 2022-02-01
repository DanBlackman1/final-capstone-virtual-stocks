package com.techelevator.dao;

import com.techelevator.model.Game;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcGameDAO implements GameDao{

    private JdbcTemplate template;

    public JdbcGameDAO(DataSource datasource) {
        template = new JdbcTemplate(datasource);
    }


    @Override
    public List<Game> getGames(int userId) {
        List<Game> gameList = new ArrayList<>();

        String sql = "SELECT * FROM users u JOIN gamedata gd ON " +
                "u.user_id = gd.user_id JOIN game g ON gd.game_id" +
                " = g.game_id WHERE u.user_id = ?;";

        SqlRowSet results = template.queryForRowSet(sql, userId);

        while(results.next()){
            Game game = mapRowToGame(results);
            gameList.add(game);
        }

        return gameList;
    }

    @Override
    public Game getGame(int gameId) {
        return null;
    }

    @Override
    public void saveGame(Game gameToSave) {
        String sql = "INSERT INTO game (game_name, organizer_id, start_date, end_date)" +
                " VALUES (?, ?, ?, ?) ;";

    }

    @Override
    public void endGame(int gameId) {

    }

    @Override
    public void addUser(int gameId, int userId) {

    }
    private Game mapRowToGame(SqlRowSet rs){

        Game game = new Game();
        game.setOrganizerId(rs.getInt("organizer_id"));
        game.setGameName(rs.getString("game_name"));
        game.setStartDate(rs.getDate("start_date").toLocalDate());
        game.setEndDate(rs.getDate("end_date").toLocalDate());

        return game;

    }

}
