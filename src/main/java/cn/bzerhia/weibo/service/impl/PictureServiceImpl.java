package cn.bzerhia.weibo.service.impl;

import cn.bzerhia.weibo.entity.Blog;
import cn.bzerhia.weibo.entity.Picture;
import cn.bzerhia.weibo.mapper.PictureMapper;
import cn.bzerhia.weibo.service.PictureService;
import cn.bzerhia.weibo.util.MyBatisUtil;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class PictureServiceImpl implements PictureService {
    private MyBatisUtil myBatisUtil;
    private PictureMapper pictureMapper;
    private SqlSession session;

    public void init() {
        this.session = MyBatisUtil.getSession();
        this.pictureMapper = (PictureMapper)this.session.getMapper(PictureMapper.class);
    }
    public void close() {
        this.session.commit();
        this.session.close();
    }

    public int addPicture(Picture picture) {
        init();
        int i = this.pictureMapper.addPicture(picture);
        close();
        return i;
    }


    public List<Picture> findAll() {
        init();
        List<Picture> all = this.pictureMapper.findAll();
        close();
        return all;
    }


    public List<Picture> findByUserId(Integer userId) {
        init();
        List<Picture> byUserId = this.pictureMapper.findByUserId(userId);
        close();
        return byUserId;
    }


    public List<Picture> findByBlogId(Integer blogId) {
        init();
        List<Picture> byBlogId = this.pictureMapper.findByBlogId(blogId);
        close();
        return byBlogId;
    }


    public int delete(Integer pictureId) {
        init();
        int delete = this.pictureMapper.delete(pictureId);
        close();
        return delete;
    }


    public int update(String src) {
        init();
        int update = this.pictureMapper.update(src);
        close();
        return update;
    }


    public List<Picture> findAll2() {
        init();
        List<Picture> all = this.pictureMapper.findAll2();
        close();
        return all;
    }


    public List<Blog> findAll3() {
        init();
        List<Blog> all = this.pictureMapper.findAll3();
        close();
        return all;
    }


    public int deleteByBlogId(Integer blogId) {
        init();
        int row = this.pictureMapper.deleteByBlogId(blogId);
        close();
        return row;
    }


    public void updatePicture(String src, Integer userId, Integer blogId) {
        init();
        this.pictureMapper.updatePicture(src, userId, blogId);
        close();
    }
}
