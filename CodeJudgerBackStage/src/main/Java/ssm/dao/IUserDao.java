package ssm.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import ssm.model.User;

import java.util.List;

@Repository
public interface IUserDao {
    User getUserByID(String uuid);
    User getUserByEmail(String email);
    void createUser(User user);
    List<User> getRankUsers(int amount);
}
