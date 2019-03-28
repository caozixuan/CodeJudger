package daoTest;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;
import ssm.dao.IUserDao;
import ssm.dao.IUserInformationDao;
import ssm.model.User;
import ssm.model.UserInformation;

import javax.annotation.Resource;
import javax.validation.constraints.AssertTrue;
import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring-mvc.xml","classpath:spring-mybatis.xml"})
@Transactional
public class UserDaoTest {
    @Resource
    private IUserDao iUserDao;
    @Resource
    private IUserInformationDao iUserInformationDao;

    @Test
    public void testSelect()
    {
        User user = iUserDao.getUserByID("1");
        assertEquals(user.getNickName(),"Tom");
    }


    @Test
    public void testRank()
    {
        List<User> users = iUserDao.getRankUsers(5);
        ArrayList<UserInformation> userInformationArrayList = new ArrayList<>();
        for(User user:users)
        {
            UserInformation userInformation = iUserInformationDao.getUserInformationByUserID(user.getUserInformationID());
            userInformationArrayList.add(userInformation);
        }
        for(int i=1;i<users.size();i++)
        {
            assertTrue(userInformationArrayList.get(i).getTotalSolveValue()<=userInformationArrayList.get(i-1).getTotalSolveValue());
        }
    }

    @Test
    public void testInsert()
    {
        UserInformation userInformation = new UserInformation();
        userInformation.setTotalRightCount(12);
        userInformation.setTotalSolveValue(11);
        userInformation.setTotalSubmitCount(20);
        userInformation.setUuid("6666");
        User user = new User();
        user.setEmail("7777@qq.com");
        user.setNickName("WoW");
        user.setPassword("123456");
        user.setActivated(true);
        user.setUserInformationID("6666");
        user.setUuid("6666");
        iUserInformationDao.createUserInformation(userInformation);
        iUserDao.createUser(user);
        User selectUser = iUserDao.getUserByID("6666");
        assertEquals(selectUser.getNickName(),"WoW");

    }
}
