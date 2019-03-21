package ssm.model;

public class User {
    String uuid;                    // 用户的唯一标识uuid
    String nickName;                // 昵称
    String email;                   // 注册用邮箱（后期考虑加入邮箱验证)
    String password;                // 注册密码
    boolean isActivated=true;       // 是否激活，目前默认为true

    String userInformationID;       // 用户相关信息的ID

    public User(){

    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setActivated(boolean activated) {
        isActivated = activated;
    }

    public void setUserInformationID(String userInformationID) {
        this.userInformationID = userInformationID;
    }

    public String getUuid() {
        return uuid;
    }

    public String getNickName() {
        return nickName;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public boolean isActivated() {
        return isActivated;
    }

    public String getUserInformationID() {
        return userInformationID;
    }
}
