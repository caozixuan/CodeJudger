package ssm.dao;

import ssm.model.UserInformation;

public interface IUserInformationDao {
    UserInformation getUserInformationByUserID(String userID);
}
