package ssm.dao;

import ssm.model.User;

import java.util.List;

public interface IUserDao {
    User getUserByID(String uuid);
    List<User> getRankUsers(int amount);
}
