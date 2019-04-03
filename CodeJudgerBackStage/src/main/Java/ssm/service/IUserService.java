package ssm.service;

import org.springframework.stereotype.Service;
import ssm.model.User;

import java.util.List;


public interface IUserService {
    public User selectUser(String uuid);
    int createUser(User user);
    List<User> getRankUsers(int amount);
    public boolean login(String username,String password);
}
