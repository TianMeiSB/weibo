package cn.bzerhia.weibo.controller;

import cn.bzerhia.weibo.entity.Blog;
import cn.bzerhia.weibo.entity.Comment;
import cn.bzerhia.weibo.entity.User;
import cn.bzerhia.weibo.service.BlogService;
import cn.bzerhia.weibo.service.CommentService;
import cn.bzerhia.weibo.service.PictureService;
import cn.bzerhia.weibo.service.UserService;
import cn.bzerhia.weibo.service.impl.BlogServiceImpl;
import cn.bzerhia.weibo.service.impl.CommentServiceImpl;
import cn.bzerhia.weibo.service.impl.PictureServiceImpl;
import cn.bzerhia.weibo.service.impl.UserServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;






@Controller
public class AdminController
{
    private UserService userService = new UserServiceImpl();
    private PictureService pictureService = new PictureServiceImpl();
    private BlogService blogService = new BlogServiceImpl();
    private CommentService commentService = new CommentServiceImpl();


    @GetMapping({"backstage"})
    public String index(HttpSession session) {
        User user = (User)session.getAttribute("user");
        if (user == null || user.getType().intValue() == 0) {
            return "redirect:findByType?typeId=1";
        }
        return "admin/index";
    }



    @GetMapping({"admin/findAllUser"})
    public String findAllUser(HttpSession session, Model model) {
        User user = (User)session.getAttribute("user");
        if (user == null || user.getType().intValue() != 1) {
            return "redirect:findByType?typeId=1";
        }
        if (user.getType().intValue() == 1) {
            List<User> userList = this.userService.findAll();
            model.addAttribute("userList", userList);
            return "admin/user";
        }
        return "redirect:findByType?typeId=1";
    }
    @GetMapping({"admin/findAllPicture"})
    public String findAllPicture(HttpSession session, Model model) {
        User user = (User)session.getAttribute("user");
        if (user == null || user.getType().intValue() != 1) {
            return "redirect:findByType?typeId=1";
        }
        if (user.getType().intValue() == 1) {
            List<Blog> blogList = this.pictureService.findAll3();
            model.addAttribute("blogList", blogList);
            return "admin/picture";
        }
        return "redirect:findByType?typeId=1";
    }

    @GetMapping({"admin/findAllBlog"})
    public String findAllBlog(HttpSession session, Model model) {
        User user = (User)session.getAttribute("user");
        if (user == null || user.getType().intValue() != 1) {
            return "redirect:findByType?typeId=1";
        }
        if (user.getType().intValue() == 1) {
            List<Blog> blogList = this.blogService.findAll3();
            model.addAttribute("blogList", blogList);
            return "admin/blog";
        }
        return "redirect:findByType?typeId=1";
    }

    @PostMapping({"admin/updateUserType"})
    public void updateUserType(Integer typeId, Integer blogId, HttpServletResponse response, HttpSession session) throws IOException {
        User user = (User)session.getAttribute("user");
        if (user == null || user.getType().intValue() != 1) {
            return;
        }
        if (typeId == null || blogId == null) {
            response.getWriter().write("err");
            return;
        }
        int row = this.blogService.updateBlogType(blogId, typeId);
        if (row > 0) {
            response.getWriter().write("ok");
        } else {
            response.getWriter().write("err");
        }
    }
    @GetMapping({"admin/findAllComment"})
    public String findAllComment(HttpSession session, Model model) {
        User user = (User)session.getAttribute("user");
        if (user == null || user.getType().intValue() != 1) {
            return "redirect:findByType?typeId=1";
        }
        if (user.getType().intValue() == 1) {
            List<Comment> commentList = this.commentService.findAll2();
            model.addAttribute("commentList", commentList);
            return "admin/comment";
        }
        return "redirect:findByType?typeId=1";
    }

    @GetMapping({"admin/findAllComment2"})
    public String findAllComment2(HttpSession session, Model model) {
        User user = (User)session.getAttribute("user");
        if (user == null || user.getType().intValue() != 1) {
            return "redirect:findByType?typeId=1";
        }
        if (user.getType().intValue() == 1) {
            List<Comment> commentList = this.commentService.findAll3();
            model.addAttribute("commentList", commentList);
            return "admin/comment2";
        }
        return "redirect:findByType?typeId=1";
    }
}
