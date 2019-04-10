package ssm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import ssm.model.Problem;
import ssm.service.IProblemService;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/problems")
public class ProblemController {
    @Resource
    private IProblemService problemService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String problemList(ModelMap map){
        List<Problem> problems = problemService.getAllProblems();
        map.addAttribute("problems", problems);
        return "ProblemsDisplay";
    }

    @RequestMapping("/{problemUuid}")
    public String problemDetail(@PathVariable("problemUuid") String problemUuid, ModelMap map){
        map.addAttribute("problem", problemService.getProblemByUuid(problemUuid));
        return "ProblemDetails";
    }

    @RequestMapping("/evaluate/{problemName}")
    public String evaluateProblem(@PathVariable("problemName") String problemName){
        return "Register";
    }

    @RequestMapping("/execute/{problemName}")
    public String executeProblem(@PathVariable("problemName") String problemName, String example){
        return "Register";
    }


}
