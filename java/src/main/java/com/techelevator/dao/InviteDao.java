package com.techelevator.dao;

import com.techelevator.model.User;

import java.util.List;

public interface InviteDao {

    public void invitePlayer(int userId, int gameId);

    public void confirmInvite(int userId, int gameId);

    public List<User> displayUsers(int gameId);
}
