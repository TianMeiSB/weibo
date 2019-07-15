package cn.bzerhia.weibo.controller;

import cn.bzerhia.weibo.entity.Comment;
import cn.bzerhia.weibo.entity.User;
import cn.bzerhia.weibo.service.CommentService;
import cn.bzerhia.weibo.service.UserService;
import cn.bzerhia.weibo.service.impl.CommentServiceImpl;
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
public class CommentController {
    private CommentService commentService = new CommentServiceImpl();
    private UserService userService = new UserServiceImpl();

    @PostMapping({"addComment"})
    public void addComment(HttpSession session, HttpServletResponse response, Integer blogId, String text, Integer masterId) throws IOException {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.getWriter().write("err1");
            return;
        }
        User type = userService.findById(user.getId());
        if (type.getType() == 2) {
            response.getWriter().write("err3");
            return;
        }
        if (text == null || text.equals("") || blogId == null || masterId == null) {

            response.getWriter().write("err2");
            return;
        }
        Comment comment = new Comment();
        comment.setUserId(user.getId());
        comment.setBlogId(blogId);
        comment.setMasterId(masterId);
        comment.setText(text);
        comment.setType(Integer.valueOf(1));
        comment.setReplyTime(new Date());
        int row = this.commentService.addComment(comment);
        if (row > 0) {
            response.getWriter().write("ok");
        } else {
            response.getWriter().write("err4");
        }
    }


    @PostMapping({"addComment2"})
    public void addComment2(HttpSession session, HttpServletResponse response, Integer blogId, String text, Integer masterId, Integer commentId, String commId) throws IOException {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.getWriter().write("err1");
            return;
        }
        User type = userService.findById(user.getId());
        if (type.getType() == 2) {
            response.getWriter().write("err3");
            return;
        }
        if (text == null || text.equals("") || blogId == null || masterId == null || commentId == null) {

            response.getWriter().write("err2");
            return;
        }
        if (commId == "undefined" || commId.equals("undefined")) {
            Comment comment = new Comment();
            comment.setId(MathUtil.blogId());
            comment.setUserId(user.getId());
            comment.setBlogId(blogId);
            comment.setMasterId(masterId);
            comment.setText(text);
            comment.setType(Integer.valueOf(1));
            comment.setCommentId(commentId);
            comment.setReplyTime(new Date());
            comment.setCommId(null);
            int row = this.commentService.addComment2(comment);
            if (row > 0) {
                response.getWriter().write("ok");
            } else {
                response.getWriter().write("err4");
            }
        } else {
            Comment comment = new Comment();
            comment.setId(MathUtil.blogId());
            comment.setUserId(user.getId());
            comment.setBlogId(blogId);
            comment.setMasterId(masterId);
            comment.setText(text);
            comment.setType(Integer.valueOf(1));
            comment.setCommentId(commentId);
            comment.setReplyTime(new Date());
            comment.setCommId(Integer.valueOf(Integer.parseInt(commId)));
            int row = this.commentService.addComment2(comment);
            if (row > 0) {
                response.getWriter().write("ok");
            } else {
                response.getWriter().write("err4");
            }
        }
    }

    @PostMapping({"timing"})
    public void timing(HttpSession session, String masterId) {
        if (masterId == null || masterId.equals("undefined")) {
            return;
        }
        List<Comment> comments = this.commentService.findAllByMasterId(Integer.valueOf(Integer.parseInt(masterId)));
        List<Comment> comments2 = this.commentService.findAllByMasterId2(Integer.valueOf(Integer.parseInt(masterId)));
        session.setAttribute("comments", comments);
        session.setAttribute("comments2", comments2);
    }


    @PostMapping({"deleteComment"})
    public void deleteComment(HttpSession session, Integer userId, Integer commentId, HttpServletResponse response) throws IOException {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return;
        }
        if (user.getId() == userId || user.getType().intValue() == 1) {
            int row = this.commentService.delete(commentId);
            this.commentService.deleteCommentId(commentId);
            if (row > 0) {
                response.getWriter().write("ok");
            } else {
                response.getWriter().write("err");
            }
        }
    }

    @PostMapping({"deleteComment2"})
    public void deleteComment2(HttpSession session, Integer userId, Integer commentId, HttpServletResponse response) throws IOException {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return;
        }
        if (user.getId() == userId || user.getType().intValue() == 1) {
            int row = this.commentService.delete2(commentId);
            if (row > 0) {
                response.getWriter().write("ok");
            } else {
                response.getWriter().write("err");
            }
        }
    }
}
