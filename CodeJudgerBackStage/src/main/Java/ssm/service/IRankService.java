package ssm.service;

import ssm.model.User;

import java.util.List;

public interface IRankService {
    public List<User> getRankUsers(int amount);
}
