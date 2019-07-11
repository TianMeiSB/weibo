package cn.bzerhia.weibo.controller;

import cn.bzerhia.weibo.entity.User;
import cn.bzerhia.weibo.service.UserService;
import cn.bzerhia.weibo.service.impl.UserServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class AdminController {
    private UserService userService;

    public AdminController() {
        userService = new UserServiceImpl();
    }

    @GetMapping("backstage")
    public String index(HttpSession session){
        User user = (User)session.getAttribute("user");
        if(user==null||user.getType()==0){
            return "redirect:index";
        }else{
            return "admin/index";
        }

    }

    @GetMapping("findAllUser")
    public String findAllUser(HttpSession session, Model model){
        User user = (User)session.getAttribute("user");
        if(user==null||user.getType()!=1){
            return "redirect:index";
        }
        if (user.getType()==1){
            List<User> userList = userService.findAll();
            model.addAttribute("userList",userList);
            return "admin/index";
        }
        return "redirect:index";
    }
}
