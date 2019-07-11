package cn.bzerhia.weibo.controller;

import cn.bzerhia.weibo.entity.Blog;
import cn.bzerhia.weibo.entity.Picture;
import cn.bzerhia.weibo.entity.User;
import cn.bzerhia.weibo.service.BlogService;
import cn.bzerhia.weibo.service.PictureService;
import cn.bzerhia.weibo.service.impl.BlogServiceImpl;
import cn.bzerhia.weibo.service.impl.PictureServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class PictureController {
    private PictureService pictureService;
    private BlogService blogService;
    public PictureController() {
        pictureService = new PictureServiceImpl();
        blogService = new BlogServiceImpl();
    }
    @GetMapping("updateAlbum")
    public String update(HttpSession session, Model model){
        User user = (User)session.getAttribute("user");
        if(user==null){
            return "redirect:index";
        }else{
            List<Blog> blogList = blogService.findByPhoto(user.getId());
            model.addAttribute("blogList",blogList);
            return "user/updateAlbum";
        }
    }
}
