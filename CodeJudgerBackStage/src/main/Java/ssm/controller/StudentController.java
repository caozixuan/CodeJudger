package ssm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import ssm.model.Student;
import ssm.service.IStudentService;
import ssm.service.StudentService;

import javax.annotation.Resource;

@Controller
@RequestMapping("/home")
public class StudentController {
    @Resource
    private IStudentService studentService;
    @RequestMapping("/index")
    public String index() {
        Student s = studentService.selectStudent(1);
        System.out.println(s.getGrade());
        System.out.println(s.getName());
        return "index";
    }
}
