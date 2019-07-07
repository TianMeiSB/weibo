package cn.bzerhia.weibo.controller;

import cn.bzerhia.weibo.constant.Constant;
import cn.bzerhia.weibo.entity.Blog;
import cn.bzerhia.weibo.service.BlogService;
import cn.bzerhia.weibo.service.impl.BlogServiceImpl;
import cn.bzerhia.weibo.util.MathUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;

@Controller
public class BlogController {
    private BlogService blogService;
    public BlogController() {
        blogService = new BlogServiceImpl();
    }


    @PostMapping("addBlog")
    public void addBlog(String title, String text, Integer type, Integer userId, HttpServletResponse response, HttpSession session)
            throws IOException{
        if (title==null||title.equals("")||
                type==null||userId==null){
            response.getWriter().write("err1");
            return;

        }
       if (text=="undefined"||text.equals("undefined")){
           response.getWriter().write("err2");
           return;
       }
        if (text==null||text.equals("")){
            response.getWriter().write("err3");
            return;
        }
        Integer id = MathUtil.blogId();
        String fengmian = (String)session.getAttribute("fengmian");
        System.out.println(fengmian);
        Blog blog = new Blog();
        blog.setId(id);
        blog.setTitle(title);
        blog.setTitlePage(fengmian!=null?fengmian:Constant.HEADSHOT_FENGMIAN2);
        blog.setText(text);
        blog.setUserId(userId);
        blog.setTypeId(type);
        blog.setBlogType(1);
        blog.setPublishTime(new Date());
        int row = blogService.addBlog(blog);
        if(row>0){
            response.getWriter().write("ok");
            session.removeAttribute("fengmian");
        }else{
            response.getWriter().write("error4");
        }
    }

}
