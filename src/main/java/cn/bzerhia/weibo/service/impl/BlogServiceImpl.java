package cn.bzerhia.weibo.service.impl;

import cn.bzerhia.weibo.entity.Blog;
import cn.bzerhia.weibo.mapper.BlogMapper;
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

    public void init() {
        this.session = MyBatisUtil.getSession();
        this.blogMapper = (BlogMapper)this.session.getMapper(BlogMapper.class);
    }
    public void close() {
        this.session.commit();
        this.session.close();
    }



    public List<Blog> findAll() {
        init();
        List<Blog> blogList = this.blogMapper.findAll();
        close();
        return blogList;
    }


    public List<Blog> findAll2() {
        init();
        List<Blog> blogList = this.blogMapper.findAll2();
        close();
        return blogList;
    }


    public List<Blog> findAll3() {
        init();
        List<Blog> blogList = this.blogMapper.findAll3();
        close();
        return blogList;
    }


    public int addBlog(Blog blog) {
        init();
        int row = this.blogMapper.addBlog(blog);
        close();
        return row;
    }


    public Blog findByTitle(String title) {
        init();
        Blog byTitle = this.blogMapper.findByTitle(title);
        close();
        return byTitle;
    }


    public Blog findById(Integer id) {
        init();
        Blog byId = this.blogMapper.findById(id);
        close();
        return byId;
    }


    public List<Blog> findAllByPhoto() {
        init();
        List<Blog> list = this.blogMapper.findAllByPhoto();
        close();
        return list;
    }


    public List<Blog> findByPhoto(Integer userId) {
        init();
        List<Blog> list = this.blogMapper.findByPhoto(userId);
        close();
        return list;
    }


    public List<Blog> findByUserId(Integer userId) {
        init();
        List<Blog> list = this.blogMapper.findByUserId(userId);
        close();
        return list;
    }


    public List<Blog> findByUserId2(Integer userId) {
        init();
        List<Blog> list = this.blogMapper.findByUserId2(userId);
        close();
        return list;
    }


    public List<Blog> findByLike(String like) {
        init();
        List<Blog> blogList = this.blogMapper.findByLike(like);
        close();
        return blogList;
    }


    public List<Blog> findByTime() {
        init();
        List<Blog> list = this.blogMapper.findByTime();
        close();
        return list;
    }


    public List<Blog> findByType(Integer type) {
        init();
        List<Blog> list = this.blogMapper.findByType(type);
        close();
        return list;
    }


    public List<Blog> findByType2() {
        init();
        List<Blog> byType2 = this.blogMapper.findByType2();
        close();
        return byType2;
    }


    public int delete(Integer blogId) {
        init();
        int delete = this.blogMapper.delete(blogId);
        close();
        return delete;
    }


    public int update(Blog blog) {
        init();
        int update = this.blogMapper.update(blog);
        close();
        return update;
    }


    public void updateTitlePage(String titlePage, Integer blogId) {
        init();
        this.blogMapper.updateTitlePage(titlePage, blogId);
        close();
    }


    public Blog findById2(Integer id) {
        init();
        Blog blog = this.blogMapper.findById2(id);
        close();
        return blog;
    }


    public int updateBlogType(Integer blogId, Integer typeId) {
        init();
        int row = this.blogMapper.updateBlogType(blogId, typeId);
        close();
        return row;
    }
}
