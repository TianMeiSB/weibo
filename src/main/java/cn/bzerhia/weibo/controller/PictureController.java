package cn.bzerhia.weibo.controller;

import cn.bzerhia.weibo.controller.PictureController;
import cn.bzerhia.weibo.entity.Blog;
import cn.bzerhia.weibo.entity.User;
import cn.bzerhia.weibo.service.BlogService;
import cn.bzerhia.weibo.service.PictureService;
import cn.bzerhia.weibo.service.impl.BlogServiceImpl;
import cn.bzerhia.weibo.service.impl.PictureServiceImpl;
import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;




@Controller
public class PictureController
{
    private PictureService pictureService = new PictureServiceImpl();
    private BlogService blogService = new BlogServiceImpl();

    @GetMapping({"updateAlbum"})
    public String update(HttpSession session, Model model) {
        User user = (User)session.getAttribute("user");
        if (user == null) {
            return "redirect:findByType?typeId=1";
        }
        List<Blog> blogList = this.blogService.findByPhoto(user.getId());
        model.addAttribute("blogList", blogList);
        return "user/updateAlbum";
    }



    @PostMapping({"deletePicture"})
    public void deletePicture(HttpSession session, Integer userId, Integer pictureId, HttpServletResponse response) throws IOException {
        User user = (User)session.getAttribute("user");
        if (user == null) {
            return;
        }
        if (user.getId() == userId || user.getType().intValue() == 1) {
            int row = this.pictureService.delete(pictureId);
            if (row > 0) {
                response.getWriter().write("ok");
            } else {
                response.getWriter().write("err");
            }
        }
    }
}
