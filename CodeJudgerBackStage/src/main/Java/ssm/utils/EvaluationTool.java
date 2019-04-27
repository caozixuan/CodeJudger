package ssm.utils;

import ssm.dao.IProblemDao;
import ssm.model.Problem;
import ssm.model.Submit;

import javax.annotation.Resource;

public class EvaluationTool{

    @Resource
    private IProblemDao iProblemDao;

    private Compiler compiler = new Compiler();

    private Judger judger = new Judger();
/*
   public boolean evaluate (Submit submit)throws Exception
    {
        String problemID = submit.getProblemID();
        Problem problem = iProblemDao.getProblemByID(problemID);
        if(!compiler.compileCode(submit))
        {
            return false;
        }
        if(!judger.run(submit))
            return false;
        return true;
    }
 */

}
