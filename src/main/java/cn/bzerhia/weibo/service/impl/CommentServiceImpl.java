package cn.bzerhia.weibo.service.impl;

import cn.bzerhia.weibo.entity.Comment;
import cn.bzerhia.weibo.mapper.BlogMapper;
import cn.bzerhia.weibo.mapper.CommentMapper;
import cn.bzerhia.weibo.service.CommentService;
import cn.bzerhia.weibo.util.MyBatisUtil;
import org.apache.ibatis.session.SqlSession;

public class CommentServiceImpl implements CommentService {
    private MyBatisUtil myBatisUtil;
    private CommentMapper commentMapper;
    private SqlSession session;
    public void init(){
        session = MyBatisUtil.getSession();
        commentMapper = session.getMapper(CommentMapper.class);
    }
    public void close(){
        session.commit();
        session.close();
    }

    @Override
    public int addComment(Comment comment) {
        init();
        int row = commentMapper.addComment(comment);
        close();
        return row;
    }

    @Override
    public int addComment2(Comment comment) {
        init();
        int row = commentMapper.addComment2(comment);
        close();
        return row;
    }
}
