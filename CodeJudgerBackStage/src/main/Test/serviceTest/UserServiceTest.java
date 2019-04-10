package serviceTest;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;
import ssm.dao.IUserDao;
import ssm.model.User;
import ssm.service.IUserService;

import javax.annotation.Resource;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring-mvc.xml","classpath:spring-mybatis.xml"})
@Transactional
public class UserServiceTest {
    @Resource
    private IUserService userService;

    @Resource
    private IUserDao iUserDao;

    @Test
    public void testLogin(){
//        User user = iUserDao.getUserByID("1");
//        boolean flag1 = userService.login(user.getEmail(),user.getPassword());
//        assertTrue(flag1);
//        boolean flag2 = userService.login(user.getEmail(),"");
//        assertFalse(flag2);
    }
}
