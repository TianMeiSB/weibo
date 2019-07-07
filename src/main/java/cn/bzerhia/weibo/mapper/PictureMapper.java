package cn.bzerhia.weibo.mapper;

import cn.bzerhia.weibo.entity.Picture;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PictureMapper {
    int addPicture(Picture picture);
    List<Picture> findAll();
    List<Picture> findByUserId(Integer userId);
    List<Picture> findByBlogId(Integer blogId);
    int delete(Integer pictureId);
    int update(String src);
    List<Picture> findAll2();
}
