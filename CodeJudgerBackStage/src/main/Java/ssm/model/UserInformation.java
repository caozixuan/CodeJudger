package ssm.model;

public class UserInformation {
    String uuid;                    // 唯一标识
    String userID;                  // 用户唯一标识
    int totalSolveValue;            // 解决问题的总价值
    int totalSubmitCount;           // 提交总数
    int totalRightCount;            // 正确总数

    public UserInformation(){

    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public void setTotalSolveValue(int totalSolveValue) {
        this.totalSolveValue = totalSolveValue;
    }

    public void setTotalSubmitCount(int totalSubmitCount) {
        this.totalSubmitCount = totalSubmitCount;
    }

    public void setTotalRightCount(int totalRightCount) {
        this.totalRightCount = totalRightCount;
    }

    public String getUuid() {
        return uuid;
    }

    public String getUserID() {
        return userID;
    }

    public int getTotalSolveValue() {
        return totalSolveValue;
    }

    public int getTotalSubmitCount() {
        return totalSubmitCount;
    }

    public int getTotalRightCount() {
        return totalRightCount;
    }
}
