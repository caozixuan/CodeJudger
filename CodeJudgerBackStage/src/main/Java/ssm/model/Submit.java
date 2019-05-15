package ssm.model;

import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;

public class Submit {
    String uuid;                     // 提交唯一标识
    String problemID;                // 对应问题ID
    String userID;                   // 对应用户ID

    String code;                     // 提交的代码（不确定是否要用这种形式）

    Timestamp submitDate;                 // 提交日期
    boolean isPassed;                // 是否通过
    double score;                    // 得分
    String codeLanguage;             // 编程语言

    public String getProblemName() {
        return problemName;
    }

    public void setProblemName(String problemName) {
        this.problemName = problemName;
    }

    String problemName = "Default";

    public Submit(){

    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public void setProblemID(String problemID) {
        this.problemID = problemID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public void setSubmitDate(Timestamp submitDate) {
        this.submitDate = submitDate;
    }

    public void setPassed(boolean passed) {
        isPassed = passed;
    }

    public void setScore(double score) {
        this.score = score;
    }


    public void setCodeLanguage(String codeLanguage) {
        this.codeLanguage = codeLanguage;
    }

    public String getUuid() {
        return uuid;
    }

    public String getProblemID() {
        return problemID;
    }

    public String getUserID() {
        return userID;
    }

    public String getCode() {
        return code;
    }

    public Timestamp getSubmitDate() {
        return submitDate;
    }

    public boolean isPassed() {
        return isPassed;
    }

    public double getScore() {
        return score;
    }

    public String getCodeLanguage() {
        return codeLanguage;
    }
}
