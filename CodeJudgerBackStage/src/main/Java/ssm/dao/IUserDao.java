package ssm.dao;

import org.apache.ibatis.annotations.Param;
import ssm.model.User;

import java.util.List;

public interface IUserDao {
    User getUserByID(String uuid);

    int createUser(User user);
    List<User> getRankUsers(int amount);
}
