package ssm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import ssm.dao.IUserDao;
import ssm.dao.IUserInformationDao;
import ssm.model.User;
import ssm.model.UserInformation;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/rank")
public class RankController {
    @Resource
    IUserDao iUserDao;

    @Resource
    IUserInformationDao iUserInformationDao;
    @RequestMapping("/")
    public String rank(ModelMap map){
        List<User> users = this.iUserDao.getRankUsers(100);
        ArrayList<UserInformation> userInformations = new ArrayList<>();
        for(User u:users)
        {
            UserInformation ui = iUserInformationDao.getUserInformationByUserID(u.getUuid());
            userInformations.add(ui);
        }
        map.addAttribute("users", users);
        map.addAttribute("userInformations", userInformations);
        return "Rank";
    }
}
