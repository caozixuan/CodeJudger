package daoTest;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;
import ssm.dao.IProblemDao;
import ssm.model.Problem;

import javax.annotation.Resource;
import java.util.List;

import static org.junit.Assert.assertEquals;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring-mvc.xml","classpath:spring-mybatis.xml"})
@Transactional
public class ProblemDaoTest {

    @Resource
    public IProblemDao iProblemDao;
    @Test
    public void testGetAll(){
        List<Problem> problems = iProblemDao.getAllProblems();
        for(Problem problem:problems)
        {
            System.out.println(problem.getProblemContent());
        }
    }

    @Test
    public void testSelect()
    {
        Problem problem = iProblemDao.getProblemByID("1");
        assertEquals(problem.getMemoryLimit(),1);
    }
}
