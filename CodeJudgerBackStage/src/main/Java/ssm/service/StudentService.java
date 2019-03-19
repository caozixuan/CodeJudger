package ssm.service;

import org.springframework.stereotype.Service;
import ssm.dao.IStudentDao;
import ssm.model.Student;

import javax.annotation.Resource;

@Service("studentService")
public class StudentService implements IStudentService{
    @Resource
    private IStudentDao studentDao;

    public Student selectStudent(int id) {
        return this.studentDao.selectStudent(id);
    }
}
