package ssm.service;

import org.springframework.stereotype.Service;
import ssm.dao.IProblemDao;
import ssm.model.Problem;

import javax.annotation.Resource;
import java.util.List;

@Service("problemService")
public class ProblemService implements IProblemService{
    @Resource
    private IProblemDao problemDao;

    public List<Problem> getAllProblems() {
        List<Problem> problems = this.problemDao.getAllProblems();
        return problems;
    }

    public Problem getProblemByUuid(String uuid) {
        Problem problem = this.problemDao.getProblemByID(uuid);
        return problem;
    }
}
