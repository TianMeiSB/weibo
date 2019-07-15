package cn.bzerhia.weibo.service.impl;

import cn.bzerhia.weibo.entity.Collect;
import cn.bzerhia.weibo.mapper.CollectMapper;
import cn.bzerhia.weibo.service.CollectService;
import cn.bzerhia.weibo.util.MyBatisUtil;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CollectServiceImpl implements CollectService {
    private MyBatisUtil myBatisUtil;

    public void init() {
        this.session = MyBatisUtil.getSession();
        this.collectMapper = (CollectMapper)this.session.getMapper(CollectMapper.class);
    } private CollectMapper collectMapper; private SqlSession session;
    public void close() {
        this.session.commit();
        this.session.close();
    }

    public int addCollection(Collect collections) {
        init();
        int row = this.collectMapper.addCollection(collections);
        close();
        return row;
    }


    public List<Collect> findAllByUserId(Integer userId) {
        init();
        List<Collect> collections = this.collectMapper.findAllByUserId(userId);
        close();
        return collections;
    }


    public int delete(Integer userId, Integer blogId) {
        init();
        int row = this.collectMapper.delete(userId, blogId);
        close();
        return row;
    }


    public Collect findByUserIdAndBlogId(Integer userId, Integer blogId) {
        init();
        Collect collections = this.collectMapper.findByUserIdAndBlogId(userId, blogId);
        close();
        return collections;
    }


    public int deleteByBlogId(Integer blogId) {
        init();
        int row = this.collectMapper.deleteByBlogId(blogId);
        close();
        return row;
    }
}
