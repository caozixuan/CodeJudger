package ssm.test;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import ssm.dao.IUserInformationDao;
import ssm.model.User;
import ssm.model.UserInformation;
import ssm.service.IUserService;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring-mvc.xml","classpath:spring-mybatis.xml" })
@Service
public class UserServiceTest extends AbstractJUnit4SpringContextTests {
    @Resource
    private IUserService userService;
    @Resource
    private IUserInformationDao userInformationDao;

    @Test
    public void testSelect(){
        User user = userService.selectUser("1");
        Assert.assertEquals(user.getNickName(), "Tom");
    }

    @Test
    public void testRank()
    {
        List<User> users = userService.getRankUsers(2);
        ArrayList<UserInformation> userInformationArrayList = new ArrayList<UserInformation>();
        for(User user:users)
        {
            UserInformation userInformation = userInformationDao.getUserInformationByUserID(user.getUuid());
            userInformationArrayList.add(userInformation);
        }
        for(int i=1;i<users.size();i++)
        {
            Assert.assertTrue(userInformationArrayList.get(i).getTotalSolveValue()>=userInformationArrayList.get(i-1).getTotalSolveValue());
        }
    }

}