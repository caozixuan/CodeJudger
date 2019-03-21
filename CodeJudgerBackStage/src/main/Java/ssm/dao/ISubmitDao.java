package ssm.dao;

import ssm.model.Submit;

import java.util.List;

public interface ISubmitDao {
    List<Submit> getAllSubmitsByUserID(String userID);
    List<Submit> getSuccessSubmitByUserID(String userID);

    Submit getSubmitByID(String uuid);


}
