package ssm.service;

import org.springframework.stereotype.Service;
import ssm.dao.IProblemDao;
import ssm.dao.ISubmitDao;
import ssm.dao.IUserInformationDao;
import ssm.model.Problem;
import ssm.model.Submit;
import ssm.model.UserInformation;

import javax.annotation.Resource;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;
import java.util.UUID;

@Service("problemService")
public class ProblemService implements IProblemService{
    @Resource
    private IProblemDao problemDao;
    @Resource
    private ISubmitDao submitDao;
    @Resource
    private IUserInformationDao userInformationDao;

    public List<Problem> getAllProblems() {
        List<Problem> problems = this.problemDao.getAllProblems();
        return problems;
    }

    public Problem getProblemByUuid(String uuid) {
        Problem problem = this.problemDao.getProblemByID(uuid);
        return problem;
    }

    public void submitRecord(String userUuid, String problemUuid, boolean isSucceessful, String code, String language) {
        Submit submit = new Submit();
        submit.setUuid(UUID.randomUUID().toString());
        submit.setProblemID(problemUuid);
        submit.setUserID(userUuid);
        submit.setCode(code);
        submit.setSubmitDate(new java.sql.Timestamp(System.currentTimeMillis()));
        submit.setPassed(isSucceessful);
        submit.setScore(problemDao.getProblemByID(problemUuid).getProblemValue());
        submit.setCodeLanguage(language);
        submitDao.createSubmit(submit);

        problemDao.updateTotalCount(problemUuid);
        if (isSucceessful)
            problemDao.updateRightCount(problemUuid);

        UserInformation userInformation = userInformationDao.getUserInformationByUserID(userUuid);
        userInformation.setTotalSubmitCount(userInformation.getTotalSubmitCount()+1);
        if (isSucceessful) {
            userInformation.setTotalRightCount(userInformation.getTotalRightCount()+1);
            userInformation.setTotalSolveValue(userInformation.getTotalSolveValue()+1);
        }
        userInformationDao.updateUserInformation(userInformation);

    }
}
