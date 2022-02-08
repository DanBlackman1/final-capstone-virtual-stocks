package com.techelevator.dao;
import com.techelevator.model.User;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcInviteDao implements InviteDao{

    private JdbcTemplate template;

    public JdbcInviteDao(DataSource datasource) {
        template = new JdbcTemplate(datasource);
    }

    @Override
    public void invitePlayer(int userId, int gameId) {
        String sql = "INSERT INTO invite (user_id, game_id) VALUES (?, ?);";
        template.update(sql, userId, gameId);
    }

    @Override
    public void confirmInvite(int userId, int gameId) {
        String sql = "UPDATE invite SET accepted = true WHERE user_id = ? AND game_id = ?;";
        template.update(sql, userId, gameId);
    }

    @Override
    public List<User> displayUsers(int gameId) {
        String sql = "SELECT u.username, u.user_id FROM users u LEFT JOIN invite" +
                " i ON i.user_id = u.user_id WHERE i.game_id IS NULL OR i.game_id != ?;";
        List<User> userList = new ArrayList<>();
        SqlRowSet results = template.queryForRowSet(sql, gameId);
        while(results.next()) {
            User user = new User();
            user.setId(results.getLong("user_id"));
            user.setUsername(results.getString("username"));
            userList.add(user);
        }
        return userList;
    }
}
