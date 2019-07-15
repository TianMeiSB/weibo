package cn.bzerhia.weibo.controller;

import cn.bzerhia.weibo.entity.Blog;
import cn.bzerhia.weibo.entity.Picture;
import cn.bzerhia.weibo.entity.User;
import cn.bzerhia.weibo.service.BlogService;
import cn.bzerhia.weibo.service.PictureService;
import cn.bzerhia.weibo.service.UserService;
import cn.bzerhia.weibo.service.impl.BlogServiceImpl;
import cn.bzerhia.weibo.service.impl.PictureServiceImpl;
import cn.bzerhia.weibo.service.impl.UserServiceImpl;
import cn.bzerhia.weibo.util.MathUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;
import java.util.List;



@Controller
public class WeiboController
{
    private BlogService blogService = new BlogServiceImpl();
    private PictureService pictureService = new PictureServiceImpl();
    private UserService userService = new UserServiceImpl();



    @PostMapping({"addWeibo"})
    public void addWeibo(String title, String text, Integer type, Integer userId, HttpServletResponse response, HttpSession session) throws IOException {
        if (title == null || title.equals("") || text == null || text
                .equals("") || type == null || userId == null) {

            response.getWriter().write("err1");
            return;
        }
        User user = this.userService.findById(userId);
        if (user.getType().intValue() == 2) {
            response.getWriter().write("err3");
            return;
        }
        Integer id = MathUtil.blogId();
        Blog blog = new Blog();
        blog.setId(id);
        blog.setTitle(title);
        blog.setText(text);
        blog.setTypeId(type);
        blog.setUserId(userId);
        blog.setBlogType(0);
        blog.setPublishTime(new Date());
        int row = this.blogService.addBlog(blog);
        System.out.println(row);
        if (session.getAttribute("picture") != null) {
            List<String> src = (List)session.getAttribute("picture");
            Picture picture = new Picture();
            for (String str : src) {
                picture.setSrc(str);
                picture.setUserId(userId);
                picture.setBlogId(id);
                this.pictureService.addPicture(picture);
            }
            UploadController.remove();
            session.removeAttribute("picture");
        }
        if (row > 0) {
            response.getWriter().write("ok");
        } else {
            response.getWriter().write("err2");
        }
    }

    @PostMapping({"updateWeibo"})
    public void updateWeiBo(String title, String text, Integer typeId, Integer blogId, HttpServletResponse response) throws IOException {
        if (title == null || title.equals("") || typeId == null || blogId == null) {

            response.getWriter().write("err1");
            return;
        }
        if (text == "undefined" || text.equals("undefined")) {
            response.getWriter().write("err2");
            return;
        }
        Blog blog = new Blog();
        blog.setId(blogId);
        blog.setTitle(title);
        blog.setText(text);
        blog.setTypeId(typeId);
        int row = this.blogService.update(blog);
        if (row > 0) {
            response.getWriter().write("ok");
        } else {
            response.getWriter().write("err5");
        }
    }
}
