package ssm.model;

public class ProblemType {
    String uuid;                       // 问题类型唯一标识
    String problemTypeName;            // 问题类型名称
    String problemTypeDescription;     // 问题类型描述

    public ProblemType(){

    }

    public String getUuid() {
        return uuid;
    }

    public String getProblemTypeName() {
        return problemTypeName;
    }

    public String getProblemTypeDescription() {
        return problemTypeDescription;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public void setProblemTypeName(String problemTypeName) {
        this.problemTypeName = problemTypeName;
    }

    public void setProblemTypeDescription(String problemTypeDescription) {
        this.problemTypeDescription = problemTypeDescription;
    }
}
