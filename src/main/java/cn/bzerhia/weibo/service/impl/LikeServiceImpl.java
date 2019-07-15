package cn.bzerhia.weibo.service.impl;

import cn.bzerhia.weibo.entity.Like;
import cn.bzerhia.weibo.mapper.LikeMapper;
import cn.bzerhia.weibo.service.LikeService;
import cn.bzerhia.weibo.util.MyBatisUtil;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class LikeServiceImpl implements LikeService {
    private MyBatisUtil myBatisUtil;
    private LikeMapper likeMapper;
    private SqlSession session;

    public void init() {
        this.session = MyBatisUtil.getSession();
        this.likeMapper = (LikeMapper)this.session.getMapper(LikeMapper.class);
    }
    public void close() {
        this.session.commit();
        this.session.close();
    }

    public int addLike(Like like) {
        init();
        int row = this.likeMapper.addLike(like);
        close();
        return row;
    }


    public List<Like> findAllByBlogId(Integer blogId) {
        init();
        List<Like> likeList = this.likeMapper.findAllByBlogId(blogId);
        close();
        return likeList;
    }


    public int delete(Integer userId, Integer blogId) {
        init();
        int row = this.likeMapper.delete(userId, blogId);
        close();
        return row;
    }


    public Like findByUserIdAndBlogId(Integer userId, Integer blogId) {
        init();
        Like like = this.likeMapper.findByUserIdAndBlogId(userId, blogId);
        close();
        return like;
    }


    public int deleteByBlogId(Integer blogId) {
        init();
        int row = this.likeMapper.deleteByBlogId(blogId);
        close();
        return row;
    }
}
