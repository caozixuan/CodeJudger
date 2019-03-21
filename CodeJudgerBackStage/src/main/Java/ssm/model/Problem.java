package ssm.model;

public class Problem {
    String uuid;                     // 唯一标识

    String problemTypeID;           // 对应问题的唯一标识

    long timeLimit;                 // 时间限制
    long memoryLimit;               // 内存限制

    String problemContent;          // 问题内容
    int problemDifficulty;          // 问题难度
    int problemValue;               // 问题价值

    int totalSubmitCount;           // 提交总数
    int totalRightCount;            // 正确总数

    public Problem() {
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public void setProblemTypeID(String problemTypeID) {
        this.problemTypeID = problemTypeID;
    }

    public void setTimeLimit(long timeLimit) {
        this.timeLimit = timeLimit;
    }

    public void setMemoryLimit(long memoryLimit) {
        this.memoryLimit = memoryLimit;
    }

    public void setProblemContent(String problemContent) {
        this.problemContent = problemContent;
    }

    public void setProblemDifficulty(int problemDifficulty) {
        this.problemDifficulty = problemDifficulty;
    }

    public void setProblemValue(int problemValue) {
        this.problemValue = problemValue;
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

    public String getProblemTypeID() {
        return problemTypeID;
    }

    public long getTimeLimit() {
        return timeLimit;
    }

    public long getMemoryLimit() {
        return memoryLimit;
    }

    public String getProblemContent() {
        return problemContent;
    }

    public int getProblemDifficulty() {
        return problemDifficulty;
    }

    public int getProblemValue() {
        return problemValue;
    }

    public int getTotalSubmitCount() {
        return totalSubmitCount;
    }

    public int getTotalRightCount() {
        return totalRightCount;
    }
}
