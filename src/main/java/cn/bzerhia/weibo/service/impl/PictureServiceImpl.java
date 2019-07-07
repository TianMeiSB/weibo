package cn.bzerhia.weibo.service.impl;

import cn.bzerhia.weibo.entity.Picture;
import cn.bzerhia.weibo.mapper.PictureMapper;
import cn.bzerhia.weibo.mapper.TypeMapper;
import cn.bzerhia.weibo.service.PictureService;
import cn.bzerhia.weibo.util.MyBatisUtil;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class PictureServiceImpl implements PictureService {
    private MyBatisUtil myBatisUtil;
    private PictureMapper pictureMapper;
    private SqlSession session;
    public void init(){
        session = MyBatisUtil.getSession();
        pictureMapper = session.getMapper(PictureMapper.class);
    }
    public void close(){
        session.commit();
        session.close();
    }
    @Override
    public int addPicture(Picture picture) {
        init();
        int i = pictureMapper.addPicture(picture);
        close();
        return i;
    }

    @Override
    public List<Picture> findAll() {
        init();
        List<Picture> all = pictureMapper.findAll();
        close();
        return all;
    }

    @Override
    public List<Picture> findByUserId(Integer userId) {
        init();
        List<Picture> byUserId = pictureMapper.findByUserId(userId);
        close();
        return byUserId;
    }

    @Override
    public List<Picture> findByBlogId(Integer blogId) {
        init();
        List<Picture> byBlogId = pictureMapper.findByBlogId(blogId);
        close();
        return byBlogId;
    }

    @Override
    public int delete(Integer pictureId) {
        init();
        int delete = pictureMapper.delete(pictureId);
        close();
        return delete;
    }

    @Override
    public int update(String src) {
        init();
        int update = pictureMapper.update(src);
        close();
        return update;
    }

    @Override
    public List<Picture> findAll2() {
        init();
        List<Picture> all = pictureMapper.findAll2();
        close();
        return all;
    }
}
