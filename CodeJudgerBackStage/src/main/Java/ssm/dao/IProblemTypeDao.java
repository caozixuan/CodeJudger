package ssm.dao;

import org.springframework.stereotype.Repository;
import ssm.model.ProblemType;

import java.util.List;

@Repository
public interface IProblemTypeDao {
    List<ProblemType> getAllProblemTypes();

}
