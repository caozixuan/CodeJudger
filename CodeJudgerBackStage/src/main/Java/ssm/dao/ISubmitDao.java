package ssm.dao;

import org.springframework.stereotype.Repository;
import ssm.model.Submit;

import java.util.List;

@Repository
public interface ISubmitDao {
    List<Submit> getAllSubmitsByUserID(String userID);
    List<Submit> getSuccessSubmitByUserID(String userID);

    Submit getSubmitByID(String uuid);


}
