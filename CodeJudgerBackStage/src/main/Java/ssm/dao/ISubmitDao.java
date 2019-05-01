package ssm.dao;

import org.springframework.stereotype.Repository;
import ssm.model.Submit;

import java.util.List;

@Repository
public interface ISubmitDao {
    List<Submit> getAllSubmitsByUserID(String userID);
    List<Submit> getSuccessSubmitByUserID(String userID);

   // List<Submit> getSubmitByUserIDAndType(String userID, String typeName);

    Submit getSubmitByID(String uuid);




}
