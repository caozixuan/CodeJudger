package ssm.service;

import org.springframework.stereotype.Service;
import ssm.model.Submit;
import ssm.model.User;
import ssm.model.UserInformation;

import java.lang.ref.SoftReference;
import java.util.List;


public interface IUserService {
    public User selectUser(String uuid);

    int createUser(User user);

    List<User> getRankUsers(int amount);

    public User login(String username,String password);

    public List<Submit> getSubmitsByUuid(String uuid);

    public UserInformation getUserInfo(String uuid);

    public int getTotalProblemsCount();

    public int getSolvedProblemsCount(String uuid);
}
