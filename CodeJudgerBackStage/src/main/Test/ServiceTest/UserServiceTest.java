package ServiceTest;

import org.junit.Assert;
import org.junit.Test;
import ssm.service.IUserService;

import javax.annotation.Resource;

public class UserServiceTest {
    @Resource
    private IUserService userService;

    @Test
    public void testAdd(){

        Assert.assertEquals(3, 3);
    }
}
