package cn.bzerhia.weibo.controller;

import cn.bzerhia.weibo.entity.Comment;
import cn.bzerhia.weibo.entity.User;
import cn.bzerhia.weibo.service.CommentService;
import cn.bzerhia.weibo.service.impl.CommentServiceImpl;
import cn.bzerhia.weibo.util.MathUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;

@Controller
public class CommentController {
    private CommentService commentService;

    public CommentController() {
        commentService = new CommentServiceImpl();
    }

    @PostMapping("addComment")
    public void addComment(HttpSession session, HttpServletResponse response,Integer blogId,String text,Integer masterId)
            throws IOException {
        User user = (User) session.getAttribute("user");
        if (user==null){
            response.getWriter().write("err1");
            return;
        }
        if (user.getType()==2){
            response.getWriter().write("err3");
            return;
        }
        if (text==null||text.equals("")||
                blogId==null||masterId==null){
            response.getWriter().write("err2");
            return;
        }
        Comment comment = new Comment();
        comment.setUserId(user.getId());
        comment.setBlogId(blogId);
        comment.setMasterId(masterId);
        comment.setText(text);
        comment.setType(1);
        comment.setReplyTime(new Date());
        int row = commentService.addComment(comment);
        if (row>0){
            response.getWriter().write("ok");
        }else{
            response.getWriter().write("err4");
        }
    }

    @PostMapping("addComment2")
    public void addComment2(HttpSession session, HttpServletResponse response,
                            Integer blogId,String text,Integer masterId,Integer commentId,String commId)
            throws IOException {
        User user = (User) session.getAttribute("user");
        if (user==null){
            response.getWriter().write("err1");
            return;
        }
        if (user.getType()==2){
            response.getWriter().write("err3");
            return;
        }
        if (text==null||text.equals("")||
                blogId==null||masterId==null||commentId==null){
            response.getWriter().write("err2");
            return;
        }
        if (commId=="undefined"||commId.equals("undefined")){
            Comment comment = new Comment();
            comment.setId(MathUtil.blogId());
            comment.setUserId(user.getId());
            comment.setBlogId(blogId);
            comment.setMasterId(masterId);
            comment.setText(text);
            comment.setType(1);
            comment.setCommentId(commentId);
            comment.setReplyTime(new Date());
            comment.setCommId(null);
            int row = commentService.addComment2(comment);
            if (row>0){
                response.getWriter().write("ok");
            }else{
                response.getWriter().write("err4");
            }
        }else{
            Comment comment = new Comment();
            comment.setId(MathUtil.blogId());
            comment.setUserId(user.getId());
            comment.setBlogId(blogId);
            comment.setMasterId(masterId);
            comment.setText(text);
            comment.setType(1);
            comment.setCommentId(commentId);
            comment.setReplyTime(new Date());
            comment.setCommId(Integer.parseInt(commId));
            int row = commentService.addComment2(comment);
            if (row>0){
                response.getWriter().write("ok");
            }else{
                response.getWriter().write("err4");
            }
        }

    }
}
