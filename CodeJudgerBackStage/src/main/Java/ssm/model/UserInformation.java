package ssm.model;

public class UserInformation {
    String uuid;                    // 唯一标识
    int totalSolveValue = 0;            // 解决问题的总价值
    int totalSubmitCount = 0;           // 提交总数
    int totalRightCount = 0;            // 正确总数

    public UserInformation(){

    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
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
