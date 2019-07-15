package cn.bzerhia.weibo.controller;

import cn.bzerhia.weibo.controller.FollowController;
import cn.bzerhia.weibo.entity.Follow;
import cn.bzerhia.weibo.service.FollowService;
import cn.bzerhia.weibo.service.impl.FollowServiceImpl;
import java.io.IOException;
import java.util.Date;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;



@Controller
public class FollowController
{
    private FollowService followService = new FollowServiceImpl();


    @PostMapping({"addFollow"})
    public void addFollow(String userId, Integer followUserId, HttpServletResponse response) throws IOException {
        if (userId == null || userId.equals("") || userId.equals("undefined")) {
            response.getWriter().write("err");
            return;
        }
        Follow follow = this.followService.findByUserIdAndFollowUserId(Integer.valueOf(Integer.parseInt(userId)), followUserId);
        if (follow == null) {
            Follow follow1 = new Follow();
            follow1.setUserId(Integer.valueOf(Integer.parseInt(userId)));
            follow1.setFollowUserId(followUserId);
            follow1.setCreateTime(new Date());
            int row = this.followService.addFollow(follow1);
            if (row > 0) {
                response.getWriter().write("ok1");
            } else {
                response.getWriter().write("err1");
            }
        } else {
            int row = this.followService.delete(Integer.valueOf(Integer.parseInt(userId)), followUserId);
            if (row > 0) {
                response.getWriter().write("ok2");
            } else {
                response.getWriter().write("err2");
            }
        }
    }
}
