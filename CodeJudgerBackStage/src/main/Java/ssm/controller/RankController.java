package ssm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/rank")
public class RankController {
    @RequestMapping("/")

    public String rank(){

        return "Rank";
    }
}
