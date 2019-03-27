package ssm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ssm.model.User;

import java.util.*;

@Controller
@RequestMapping("/user")
public class UserController {
    private static List<User> userList;

    {
        userList = new ArrayList<User>();
    }


    @RequestMapping("/{uuid}")
    public String userInformation(@PathVariable("uuid") String uuid){
        return "userInformation";
    }

    @RequestMapping("/login")
    public String login(){
        return "UserLogin";
    }

    @RequestMapping("/validateUser")
    public String validateUser(
            @RequestParam("email")String email,
            @RequestParam("password")String password, Model model) {
        for (User user: userList) {
            if (user.getEmail().equals(email) && user.getPassword().equals(password)) {
                model.addAttribute("user", user);
                return "UserPage";
            }
        }
        return "UserLogin";
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
        userList.add(user);
        return "UserLogin";
    }
}
