package cn.bzerhia.weibo.controller;

import cn.bzerhia.weibo.entity.Collect;
import cn.bzerhia.weibo.service.CollectService;
import cn.bzerhia.weibo.service.impl.CollectServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;


@Controller
public class CollectController {
    private CollectService collectService = new CollectServiceImpl();


    @PostMapping({"addCollection"})
    public void addCollection(Integer blogId, String userId, HttpServletResponse response) throws IOException {
        if (userId == null || userId.equals("") || userId.equals("undefined")) {
            response.getWriter().write("err");
            return;
        }
        Collect collect = this.collectService.findByUserIdAndBlogId(Integer.valueOf(Integer.parseInt(userId)), blogId);
        if (collect == null) {
            Collect collect1 = new Collect();
            collect1.setBlogId(blogId);
            collect1.setUserId(Integer.valueOf(Integer.parseInt(userId)));
            collect1.setCollTime(new Date());
            int row = this.collectService.addCollection(collect1);
            if (row > 0) {
                response.getWriter().write("ok1");
            } else {
                response.getWriter().write("err1");
            }
        } else {
            int row = this.collectService.delete(Integer.valueOf(Integer.parseInt(userId)), blogId);
            if (row > 0) {
                response.getWriter().write("ok2");
            } else {
                response.getWriter().write("err2");
            }
        }
    }
}
