package daoTest;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;
import ssm.dao.IUserInformationDao;
import ssm.model.User;
import ssm.model.UserInformation;

import javax.annotation.Resource;

import static junit.framework.TestCase.assertNotNull;
import static junit.framework.TestCase.assertTrue;
import static org.junit.Assert.assertEquals;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring-mvc.xml","classpath:spring-mybatis.xml"})
@Transactional
public class UserInformationDaoTest {
    @Resource
    private IUserInformationDao iUserInformationDao;

    @Test
    public void testSelect()
    {
        UserInformation userInformation = iUserInformationDao.getUserInformationByUserID("1");
        assertNotNull(userInformation);
    }

    @Test
    public void testUpdate()
    {
        UserInformation userInformation= iUserInformationDao.getUserInformationByUserID("1");
        userInformation.setTotalSubmitCount(100);
        iUserInformationDao.updateUserInformation(userInformation);
        UserInformation selectUserInformation = iUserInformationDao.getUserInformationByUserID("1");
        assertEquals(selectUserInformation.getTotalSubmitCount(),100);
    }


}
