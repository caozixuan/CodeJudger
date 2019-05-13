package ssm.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import ssm.model.Submit;
import ssm.model.User;

import java.util.List;

@Repository
public interface IUserDao {
    User getUserByID(String uuid);
    User getUserByEmail(String email);
    void createUser(User user);
    List<User> getRankUsers(int amount);

    void addScore(@Param("uuid")String uuid,@Param("score")int score);

    void addSubmit(@Param("uuid")String uuid);

    int getSolveTypeNum(@Param("uuid")String uuid,@Param("type")String typeID);

    List<Submit> getRecentSubmit(@Param("uuid")String uuid);
}
