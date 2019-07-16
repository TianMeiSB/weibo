package cn.bzerhia.weibo.controller;

import cn.bzerhia.weibo.entity.Blog;
import cn.bzerhia.weibo.entity.Comment;
import cn.bzerhia.weibo.entity.Type;
import cn.bzerhia.weibo.entity.User;
import cn.bzerhia.weibo.service.*;
import cn.bzerhia.weibo.service.impl.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;


@Controller
public class AdminController {
    private UserService userService = new UserServiceImpl();
    private PictureService pictureService = new PictureServiceImpl();
    private BlogService blogService = new BlogServiceImpl();
    private CommentService commentService = new CommentServiceImpl();
    private TypeService typeService = new TypeServiceImpl();

    @GetMapping({"backstage"})
    public String index(HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null || user.getType().intValue() == 0) {
            return "redirect:findByType?typeId=1";
        }
        return "admin/index";
    }


    @GetMapping({"admin/findAllUser"})
    public String findAllUser(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
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
        User user = (User) session.getAttribute("user");
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
        User user = (User) session.getAttribute("user");
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
        User user = (User) session.getAttribute("user");
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
        User user = (User) session.getAttribute("user");
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
        User user = (User) session.getAttribute("user");
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
    @GetMapping("admin/findAllType")
    public String findAllType(HttpSession session,Model model){
        User user = (User) session.getAttribute("user");
        if (user == null || user.getType().intValue() != 1) {
            return "redirect:findByType?typeId=1";
        }
        if (user.getType().intValue() == 1) {
            List<Type> typeList = this.typeService.findAll();
            model.addAttribute("typeList", typeList);
            return "admin/type";
        }
        return "redirect:findByType?typeId=1";
    }

    @PostMapping("admin/addType")
    public void addType(String type,HttpSession session,HttpServletResponse response)
            throws IOException{
        User user = (User) session.getAttribute("user");
        if (user == null || user.getType().intValue() != 1) {
            return;
        }
        if (type==null||type.equals("")) {
            response.getWriter().write("err");
            return;
        }
        if (user.getType().intValue() == 1) {
            Type type1 = new Type();
            type1.setClassification(type);
            int row = typeService.addType(type1);
            if (row>0){
                response.getWriter().write("ok1");
            }else {
                response.getWriter().write("err1");
            }
        }else {
            response.getWriter().write("err1");
        }
    }

    @PostMapping("admin/deleteType")
    public void deleteType(Integer typeId,HttpSession session,HttpServletResponse response)
            throws IOException{
        User user = (User) session.getAttribute("user");
        if (user == null || user.getType().intValue() != 1) {
            return;
        }
        if (typeId==null) {
            response.getWriter().write("error2");
            return;
        }
        if (user.getType().intValue() == 1) {
            int row = typeService.delete(typeId);
            if (row>0){
                response.getWriter().write("ok2");
            }else {
                response.getWriter().write("error2");
            }
        }else {
            response.getWriter().write("error2");
        }
    }
}
