package testUtils;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;
import ssm.model.Submit;
import ssm.utils.CompilerCode;

import static org.junit.Assert.fail;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring-mvc.xml","classpath:spring-mybatis.xml"})
@Transactional
public class CompilerTest {

    @Test
    public void testCompiling()
    {
        String simpleCode = "public class Main{public static void main(String[] args){System.out.println(\"Hellow\");}}";
        Submit submit = new Submit();
        submit.setCode(simpleCode);
        CompilerCode c = new CompilerCode();
        try{
            // c.compileCode(submit);
        }catch (Exception e)
        {
            e.printStackTrace();
            fail();
        }
    }
}
