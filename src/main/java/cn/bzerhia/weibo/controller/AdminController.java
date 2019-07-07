package cn.bzerhia.weibo.controller;

import cn.bzerhia.weibo.entity.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;

@Controller
public class AdminController {
    @GetMapping("backstage")
    public String index(HttpSession session){
        User user = (User)session.getAttribute("user");
        if(user==null||user.getType().equals("0")||user.getType()==0){
            return "index";
        }else{
            return "admin/index";
        }

    }

}
