package cn.bzerhia.weibo.service.impl;

import cn.bzerhia.weibo.entity.Comment;
import cn.bzerhia.weibo.mapper.CommentMapper;
import cn.bzerhia.weibo.service.CommentService;
import cn.bzerhia.weibo.util.MyBatisUtil;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class CommentServiceImpl implements CommentService {
    private MyBatisUtil myBatisUtil;
    private CommentMapper commentMapper;
    private SqlSession session;

    public void init() {
        this.session = MyBatisUtil.getSession();
        this.commentMapper = (CommentMapper)this.session.getMapper(CommentMapper.class);
    }
    public void close() {
        this.session.commit();
        this.session.close();
    }


    public int addComment(Comment comment) {
        init();
        int row = this.commentMapper.addComment(comment);
        close();
        return row;
    }


    public int addComment2(Comment comment) {
        init();
        int row = this.commentMapper.addComment2(comment);
        close();
        return row;
    }


    public List<Comment> findAll() {
        init();
        List<Comment> all = this.commentMapper.findAll();
        close();
        return all;
    }


    public List<Comment> findAll2() {
        init();
        List<Comment> all = this.commentMapper.findAll2();
        close();
        return all;
    }


    public List<Comment> findAll3() {
        init();
        List<Comment> all = this.commentMapper.findAll3();
        close();
        return all;
    }


    public List<Comment> findAllByMasterId(Integer masterId) {
        init();
        List<Comment> list = this.commentMapper.findAllByMasterId(masterId);
        close();
        return list;
    }


    public List<Comment> findAllByMasterId2(Integer masterId) {
        init();
        List<Comment> list = this.commentMapper.findAllByMasterId2(masterId);
        close();
        return list;
    }


    public List<Comment> findById(Integer masterId) {
        init();
        List<Comment> list = this.commentMapper.findById(masterId);
        close();
        return list;
    }


    public List<Comment> findById2(Integer masterId) {
        init();
        List<Comment> list = this.commentMapper.findById2(masterId);
        close();
        return list;
    }


    public void updateComment(Integer masterId) {
        init();
        this.commentMapper.updateComment(masterId);
        close();
    }

    public void updateComment2(Integer masterId) {
        init();
        this.commentMapper.updateComment2(masterId);
        close();
    }


    public int delete(Integer commentId) {
        init();
        int row = this.commentMapper.delete(commentId);
        close();
        return row;
    }


    public int delete2(Integer commentId) {
        init();
        int row = this.commentMapper.delete2(commentId);
        close();
        return row;
    }


    public int deleteCommentId(Integer commentId) {
        init();
        int row = this.commentMapper.deleteCommentId(commentId);
        close();
        return row;
    }


    public int deleteByBlogId(Integer blogId) {
        init();
        int row = this.commentMapper.deleteByBlogId(blogId);
        close();
        return row;
    }


    public int deleteByBlogId2(Integer blogId) {
        init();
        int row = this.commentMapper.deleteByBlogId2(blogId);
        close();
        return row;
    }
}
