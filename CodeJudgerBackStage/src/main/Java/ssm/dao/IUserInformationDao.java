package ssm.dao;

import org.springframework.stereotype.Repository;
import ssm.model.UserInformation;

@Repository
public interface IUserInformationDao {
    UserInformation getUserInformationByUserID(String userID);
    int updateUserInformation(UserInformation userInformation);
    int createUserInformation(UserInformation userInformation);
}
