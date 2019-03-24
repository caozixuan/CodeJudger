package ssm.dao;

import ssm.model.Problem;

import java.util.List;

public interface IProblemDao {
    List<Problem> getAllProblems();

    //Problem getProblemByID(String uuid);
}
