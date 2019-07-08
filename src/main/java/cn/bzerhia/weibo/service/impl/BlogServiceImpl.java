package cn.bzerhia.weibo.service.impl;

import cn.bzerhia.weibo.entity.Blog;
import cn.bzerhia.weibo.mapper.BlogMapper;
import cn.bzerhia.weibo.mapper.UserMapper;
import cn.bzerhia.weibo.service.BlogService;
import cn.bzerhia.weibo.util.MyBatisUtil;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BlogServiceImpl implements BlogService {
    private MyBatisUtil myBatisUtil;
    private BlogMapper blogMapper;
    private SqlSession session;
    public void init(){
        session = MyBatisUtil.getSession();
        blogMapper = session.getMapper(BlogMapper.class);
    }
    public void close(){
        session.commit();
        session.close();
    }


    @Override
    public List<Blog> findAll() {
        init();
        List<Blog> blogList = blogMapper.findAll();
        close();
        return blogList;
    }

    @Override
    public int addBlog(Blog blog) {
        init();
        int row = blogMapper.addBlog(blog);
        close();
        return row;
    }

    @Override
    public Blog findByTitle(String title) {
        init();
        Blog byTitle = blogMapper.findByTitle(title);
        close();
        return byTitle;
    }

    @Override
    public Blog findById(Integer id) {
        init();
        Blog byId = blogMapper.findById(id);
        close();
        return byId;
    }

    @Override
    public List<Blog> findAllByPhoto() {
        init();
        List<Blog> list = blogMapper.findAllByPhoto();
        close();
        return list;
    }

    @Override
    public List<Blog> findByPhoto(Integer userId) {
        init();
        List<Blog> list = blogMapper.findByPhoto(userId);
        close();
        return list;
    }

    @Override
    public List<Blog> findByUserId(Integer userId) {
        init();
        List<Blog> list = blogMapper.findByUserId(userId);
        close();
        return list;
    }
}
