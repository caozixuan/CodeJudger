package ssm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import ssm.model.Problem;
import ssm.service.IProblemService;
import ssm.utils.CompilerCode;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.Collections;
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


    @PostMapping(value = "/evaluate/{problemUuid}")
    @ResponseBody
    public boolean evaluateProblem(@PathVariable("problemUuid") String problemUuid, String code, String timeLimit, String memoryLimit, String userUuid, String language){
        System.out.println(timeLimit);
        System.out.println(memoryLimit);

        boolean judgeResult = false;
        try {
            judgeResult = CompilerCode.judge(code, problemUuid+".out",language,problemUuid+".in", Integer.valueOf(timeLimit), Integer.valueOf(memoryLimit));
        }
        catch (Exception e) {

        }

        problemService.submitRecord(userUuid, problemUuid, judgeResult, code, language);

        return judgeResult;
    }

    @RequestMapping("/execute/{problemUuid}")
    public String executeProblem(@PathVariable("problemUuid") String problemUuid, String example){
        return "Register";
    }


}
