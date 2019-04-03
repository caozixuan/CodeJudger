package ssm.service;

import org.springframework.stereotype.Service;
import ssm.dao.IUserDao;
import ssm.dao.IUserInformationDao;
import ssm.model.User;
import ssm.model.UserInformation;

import javax.annotation.Resource;
import java.util.List;
import java.util.UUID;

@Service("UserService")
public class UserService implements IUserService{

    @Resource
    private IUserDao iUserDao;
    @Resource
    private IUserInformationDao iUserInformationDao;

    public User selectUser(String uuid){
        return iUserDao.getUserByID(uuid);
    }

    public int createUser(User user) {
        try {
            UserInformation userInformation = new UserInformation();
            userInformation.setUuid(user.getUuid());
            iUserInformationDao.createUserInformation(userInformation);
            user.setUserInformationID(user.getUuid());
            iUserDao.createUser(user);
        }
        catch (Exception e) {
            return 1;
        }

        return 0;
    }

    public List<User> getRankUsers(int amount){
        return iUserDao.getRankUsers(amount);
    }

    public boolean login(String email,String password) {
        User user = iUserDao.getUserByEmail(email);
        if (user != null) {
            if (user.getEmail().equals(email) && user.getPassword().equals(password))
                return true;
        }
        return false;
    }
}
