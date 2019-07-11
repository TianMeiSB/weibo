package cn.bzerhia.weibo.controller;

import cn.bzerhia.weibo.entity.Type;
import cn.bzerhia.weibo.entity.User;
import cn.bzerhia.weibo.service.TypeService;
import cn.bzerhia.weibo.service.impl.TypeServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class TypeController {
    private TypeService typeService;

    public TypeController() {
        typeService = new TypeServiceImpl();
    }

    @GetMapping("addblog")
    public String addBlog(HttpSession session, Model model){
        User user = (User)session.getAttribute("user");
        if(user==null){
            return "redirect:index";
        }else{
            List<Type> typeList = typeService.findAll();
            model.addAttribute("typeList",typeList);
            return "user/addBlog";
        }
    }

    @GetMapping("addweibo")
    public String addweibo(HttpSession session, Model model){
        User user = (User)session.getAttribute("user");
        if(user==null){
            return "redirect:index";
        }else{
            List<Type> typeList = typeService.findAll();
            model.addAttribute("typeList",typeList);
            return "user/addWeibo";
        }
    }
}
