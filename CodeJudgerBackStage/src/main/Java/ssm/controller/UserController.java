package ssm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ssm.model.User;
import ssm.service.IUserService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.*;

@Controller
@RequestMapping("/user")
public class UserController {
    @Resource
    private IUserService userService;


    @RequestMapping("/{uuid}")
    public String userInformation(@PathVariable("uuid") String uuid){
        return "userInformation";
    }

    @RequestMapping("/login")
    public String login(){
        return "UserLogin";
    }

    @RequestMapping("/logout")
    public String logout(HttpServletRequest request) {
        request.getSession().invalidate();
        return "redirect:/problems/";
    }

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
            return "UserLogin";
        }
    }

    // Register
    @RequestMapping("/register")
    public String register(){
        return "Register";
    }

    // Add a new user.
    @RequestMapping("/addUser")
    public String addUser(
            @RequestParam("nickName")String nickName,
            @RequestParam("email")String email,
            @RequestParam("password")String password) {
        User user = new User();
        user.setUuid(UUID.randomUUID().toString().replaceAll("-", ""));
        user.setNickName(nickName);
        user.setEmail(email);
        user.setPassword(password);
        // Code: 0-Success 1-DuplicateEmail
        int returnCode = userService.createUser(user);
        if (returnCode == 0) {
            return "UserLogin";
        }
        else if (returnCode == 1) {
            System.out.println("Duplicate Email!");
            return "Register";
        }
        return "Register";
    }
}
