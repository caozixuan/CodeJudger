package ssm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import ssm.model.Problem;
import ssm.service.IProblemService;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/problems")
public class ProblemController {
    @Resource
    private IProblemService problemService;
    @RequestMapping("/")
    public String problemList(){
        List<Problem> problems = problemService.getAllProblems();
        for(Problem problem:problems)
        {
            System.out.println(problem.getProblemContent());
        }
        return "problems";
    }

    @RequestMapping("/{problemName}")
    public String problemDetail(@PathVariable("problemName") String problemName){
        return "problemDetail";
    }

    @RequestMapping("/evaluate/{problemName}")
    public String evaluateProblem(@PathVariable("problemName") String problemName){
        return "problemDetail";
    }

    @RequestMapping("/execute/{problemName}")
    public String executeProblem(@PathVariable("problemName") String problemName, String example){
        return "programDetail";
    }


}
