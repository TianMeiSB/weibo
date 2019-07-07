package cn.bzerhia.weibo.service;

import cn.bzerhia.weibo.entity.Picture;

import java.util.List;

public interface PictureService {
    int addPicture(Picture picture);
    List<Picture> findAll();
    List<Picture> findByUserId(Integer userId);
    List<Picture> findByBlogId(Integer blogId);
    int delete(Integer pictureId);
    int update(String src);
    List<Picture> findAll2();
}
