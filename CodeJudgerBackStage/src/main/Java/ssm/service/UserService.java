package ssm.service;

import org.springframework.stereotype.Service;
import ssm.dao.IProblemDao;
import ssm.dao.ISubmitDao;
import ssm.dao.IUserDao;
import ssm.dao.IUserInformationDao;
import ssm.model.Submit;
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
    @Resource
    private ISubmitDao submitDao;
    @Resource
    private IProblemDao problemDao;

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

    public User login(String email,String password) {
        User user = iUserDao.getUserByEmail(email);
        if (user != null) {
            if (user.getEmail().equals(email) && user.getPassword().equals(password))
                return user;
        }
        return null;
    }

    public List<Submit> getSubmitsByUuid(String uuid) {
        List<Submit> submits = submitDao.getAllSubmitsByUserID(uuid);
        for (Submit submit: submits) {
            submit.setProblemName(problemDao.getProblemByID(submit.getProblemID()).getName());
        }
        return submits;
    }

    public UserInformation getUserInfo(String uuid) {
        return iUserInformationDao.getUserInformationByUserID(uuid);
    }

    public int getTotalProblemsCount() {
        return problemDao.getProblemsCount();
    }

    public int getSolvedProblemsCount(String uuid) {
        return submitDao.getSolvedProblemsCount(uuid);
    }
}
