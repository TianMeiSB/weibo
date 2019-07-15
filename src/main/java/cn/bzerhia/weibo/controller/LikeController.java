package cn.bzerhia.weibo.controller;

import cn.bzerhia.weibo.controller.LikeController;
import cn.bzerhia.weibo.entity.Like;
import cn.bzerhia.weibo.service.LikeService;
import cn.bzerhia.weibo.service.impl.LikeServiceImpl;
import java.io.IOException;
import java.util.Date;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;



@Controller
public class LikeController
{
    private LikeService likeService = new LikeServiceImpl();



    @PostMapping({"addLike"})
    public void addLike(Integer blogId, String userId, HttpServletResponse response) throws IOException {
        if (userId == null || userId.equals("") || userId.equals("undefined")) {
            response.getWriter().write("err");
            return;
        }
        Like like = this.likeService.findByUserIdAndBlogId(Integer.valueOf(Integer.parseInt(userId)), blogId);
        if (like == null) {
            Like like1 = new Like();
            like1.setBlogId(blogId);
            like1.setUserId(Integer.valueOf(Integer.parseInt(userId)));
            like1.setCreateTime(new Date());
            int row = this.likeService.addLike(like1);
            if (row > 0) {
                response.getWriter().write("ok1");
            } else {
                response.getWriter().write("err1");
            }
        } else {
            int row = this.likeService.delete(Integer.valueOf(Integer.parseInt(userId)), blogId);
            if (row > 0) {
                response.getWriter().write("ok2");
            } else {
                response.getWriter().write("err2");
            }
        }
    }
}
