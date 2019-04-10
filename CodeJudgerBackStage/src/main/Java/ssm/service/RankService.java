package ssm.service;

import org.springframework.stereotype.Service;
import ssm.dao.IUserDao;
import ssm.model.User;

import javax.annotation.Resource;
import java.util.List;

@Service("RankService")
public class RankService {
    @Resource
    private IUserDao iUserDao;

    public List<User> getRankUsers(int amount) {
        List<User> users = this.iUserDao.getRankUsers(amount);
        return users;
    }
}
