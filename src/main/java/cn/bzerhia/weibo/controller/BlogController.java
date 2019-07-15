package cn.bzerhia.weibo.controller;

import cn.bzerhia.weibo.constant.Constant;
import cn.bzerhia.weibo.entity.*;
import cn.bzerhia.weibo.service.*;
import cn.bzerhia.weibo.service.impl.*;
import cn.bzerhia.weibo.util.MathUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@Controller
public class BlogController {
    private BlogService blogService = new BlogServiceImpl();
    private UserService userService = new UserServiceImpl();
    private TypeService typeService = new TypeServiceImpl();
    private CollectService collectService = new CollectServiceImpl();
    private LikeService likeService = new LikeServiceImpl();
    private CommentService commentService = new CommentServiceImpl();
    private PictureService pictureService = new PictureServiceImpl();



    @PostMapping({"addBlog"})
    public void addBlog(String title, String text, Integer type, Integer userId, HttpServletResponse response, HttpSession session) throws IOException {
        if (title == null || title.equals("") || type == null || userId == null) {

            response.getWriter().write("err1");

            return;
        }
        User user = this.userService.findById(userId);
        if (user.getType().intValue() == 2) {
            response.getWriter().write("err4");
            return;
        }
        if (text == "undefined" || text.equals("undefined")) {
            response.getWriter().write("err2");
            return;
        }
        if (text == null || text.equals("")) {
            response.getWriter().write("err3");
            return;
        }
        Integer id = MathUtil.blogId();
        String fengmian = (String)session.getAttribute("fengmian");
        Blog blog = new Blog();
        blog.setId(id);
        blog.setTitle(title);
        blog.setTitlePage((fengmian != null) ? fengmian : Constant.HEADSHOT_FENGMIAN2);
        blog.setText(text);
        blog.setUserId(userId);
        blog.setTypeId(type);
        blog.setBlogType(Integer.valueOf(1));
        blog.setPublishTime(new Date());
        int row = this.blogService.addBlog(blog);
        if (row > 0) {
            response.getWriter().write("ok");
            session.removeAttribute("fengmian");
        } else {
            response.getWriter().write("err5");
        }
    }

    @GetMapping({"seeBlog"})
    public String seeBlog(Integer blogId, Model model, HttpSession session) {
        User user = (User)session.getAttribute("user");
        if (blogId == null) {
            return "redirect:findByType?typeId=1";
        }
        Blog blog = this.blogService.findById(blogId);
        Collect collect = null;
        Like like = null;
        List<Like> likeList = null;
        if (user != null) {
            collect = this.collectService.findByUserIdAndBlogId(user.getId(), blogId);
            like = this.likeService.findByUserIdAndBlogId(user.getId(), blogId);
            likeList = this.likeService.findAllByBlogId(blogId);
        }
        if (blog == null) {
            return "redirect:findByType?typeId=1";
        }
        model.addAttribute("blog", blog);
        model.addAttribute("collect", collect);
        model.addAttribute("like", like);
        model.addAttribute("likeList", likeList);
        return "seeBlog";
    }


    @GetMapping({"findByType"})
    public String findByTypeId(Integer typeId, Model model, HttpSession session) {
        if (typeId == null) {
            return "redirect:findByType?typeId=1";
        }
        List<Blog> blogList = this.blogService.findByType(typeId);
        List<Blog> blogByTime = this.blogService.findByTime();
        List<Blog> byType = this.blogService.findByType2();
        List<Type> typeList = this.typeService.findAll2();
        model.addAttribute("blogByTime", blogByTime);
        model.addAttribute("blogByType", byType);
        model.addAttribute("blogList", blogList);
        model.addAttribute("typeId", typeId);
        model.addAttribute("typeList", typeList);
        UserController userController = new UserController();
        userController.util(session);
        return "index";
    }

    @GetMapping({"user/myCollect"})
    public String myCollect(HttpSession session, Model model) {
        User user = (User)session.getAttribute("user");
        if (user == null) {
            return "redirect:findByType?typeId=1";
        }
        List<Collect> collectList = this.collectService.findAllByUserId(user.getId());
        model.addAttribute("collectList", collectList);
        return "user/myCollect";
    }

    @PostMapping({"deleteBlog"})
    public void delete(HttpSession session, Integer userId, Integer blogId, HttpServletResponse response) throws IOException {
        User user = (User)session.getAttribute("user");
        if (user == null) {
            return;
        }
        if (user.getId() == userId || user.getType().intValue() == 1) {
            int row = this.blogService.delete(blogId);
            this.collectService.deleteByBlogId(blogId);
            this.likeService.deleteByBlogId(blogId);
            this.commentService.deleteByBlogId(blogId);
            this.commentService.deleteByBlogId2(blogId);
            this.pictureService.deleteByBlogId(blogId);
            if (row > 0) {
                response.getWriter().write("ok");
            } else {
                response.getWriter().write("err");
            }
        }
    }

    @GetMapping({"updateblog"})
    public String updateBlog(Integer blogId, Model model, HttpSession session) {
        User user = (User)session.getAttribute("user");
        if (user == null) {
            return "redirect:findByType?typeId=1";
        }
        Blog blog = this.blogService.findById2(blogId);
        List<Type> typeList = this.typeService.findAll2();
        if (blog == null) {
            return "redirect:findByType?typeId=1";
        }
        if (blog.getUserId() == user.getId() || user.getType().intValue() == 1) {

            if (blog.getBlogType().intValue() == 0) {
                model.addAttribute("typeList", typeList);
                model.addAttribute("blog", blog);
                return "user/updateWeibo";
            } else {
                model.addAttribute("typeList", typeList);
                model.addAttribute("blog", blog);
                return "user/updateBlog";
            }
        }
        return "redirect:findByType?typeId=1";
    }


    @PostMapping({"updateBlog"})
    public void updateBlog2(String title, String text, Integer typeId, Integer blogId, HttpServletResponse response) throws IOException {
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
