package ssm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/problems")
public class ProblemController {

    @RequestMapping("/")
    public String problemList(){
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
