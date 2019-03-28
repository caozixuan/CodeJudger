package ssm.service;

import org.springframework.stereotype.Service;
import ssm.dao.IUserDao;
import ssm.model.User;

import javax.annotation.Resource;
import java.util.List;

@Service("UserService")
public class UserService {

    @Resource
    private IUserDao iUserDao;
    public User selectUser(String uuid){
        return iUserDao.getUserByID(uuid);
    }
    int createUser(User user){
        return 0;
    }
    List<User> getRankUsers(int amount){
        return iUserDao.getRankUsers(amount);
    }
}
