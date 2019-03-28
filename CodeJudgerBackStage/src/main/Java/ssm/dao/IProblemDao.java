package ssm.dao;

import org.springframework.stereotype.Repository;
import ssm.model.Problem;

import java.util.List;

@Repository
public interface IProblemDao {
    List<Problem> getAllProblems();

    Problem getProblemByID(String uuid);
}
