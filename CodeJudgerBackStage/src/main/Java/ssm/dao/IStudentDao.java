package ssm.dao;

import ssm.model.Student;

public interface IStudentDao {
    Student selectStudent(int id);
}
