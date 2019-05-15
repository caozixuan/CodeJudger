package ssm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import ssm.model.Problem;
import ssm.model.Submit;
import ssm.model.User;
import ssm.service.IUserService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.*;

import org.json.JSONObject;

@Controller
@RequestMapping("/user")
public class UserController {
    @Resource
    private IUserService userService;


//    @RequestMapping("/{uuid}")
//    public String userInformation(@PathVariable("uuid") String uuid){
//        return "Information";
//    }

    @RequestMapping("/login")
    public String login(){
        return "UserLogin";
    }

    @RequestMapping("/logout")
    public String logout(HttpServletRequest request) {
        request.getSession().invalidate();
        return "redirect:/problems/";
    }

    // @RequestMapping(name = "/validateUser", method = RequestMethod.POST)
    @RequestMapping("/validateUser")
    public String validateUser(
            HttpServletRequest request,
            @RequestParam("email")String email,
            @RequestParam("password")String password, Model model) {
        User user = userService.login(email, password);
        if (user != null) {
            request.getSession().setAttribute("uuid", user.getUuid());
            request.getSession().setAttribute("nickName", user.getNickName());
            return "redirect:/problems/";
        }
        else {
            return "ProblemsDisplay";
        }
    }

    // Register
    @RequestMapping("/register")
    public String register(){
        return "Register";
    }


    @RequestMapping("/information")
    public String information(HttpServletRequest request){
        String uuid = String.valueOf(request.getSession().getAttribute("uuid"));
        List<Submit> submits = userService.getSubmitsByUuid(uuid);
        JSONObject obj = new JSONObject();
        for (Submit submit: submits) {
            obj.put(String.valueOf(submit.getSubmitDate().getTime()/1000), 1);
        }
        System.out.println(obj.toString());
        request.setAttribute("submitsByUuidJSON", obj.toString());
        request.setAttribute("submits", submits);
        request.setAttribute("userInfo", userService.getUserInfo(uuid));
        request.setAttribute("totalProblemsCount", userService.getTotalProblemsCount());
        request.setAttribute("solvedProblemsCount", userService.getSolvedProblemsCount(uuid));
        return "Information";
    }

    // Add a new user.
    @RequestMapping("/addUser")
    public String addUser(
            HttpServletRequest request,
            @RequestParam("nickname")String nickname,
            @RequestParam("email")String email,
            @RequestParam("password")String password) {
        User user = new User();
        user.setUuid(UUID.randomUUID().toString().replaceAll("-", ""));
        user.setNickName(nickname);
        user.setEmail(email);
        user.setPassword(password);
        // Code: 0-Success 1-DuplicateEmail
        int returnCode = userService.createUser(user);
        if (returnCode == 0) {
            request.getSession().setAttribute("uuid", user.getUuid());
            request.getSession().setAttribute("nickName", user.getNickName());
            return "redirect:/problems/";
        }
        else if (returnCode == 1) {
            System.out.println("Duplicate Email!");
            return "ProblemsDisplay";
        }
        return "redirect:/problems/";
    }
}
