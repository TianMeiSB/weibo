package cn.bzerhia.weibo.mapper;

import cn.bzerhia.weibo.entity.Blog;
import cn.bzerhia.weibo.entity.Picture;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PictureMapper extends BaseMapper<Picture> {
    int addPicture(Picture paramPicture);
    List<Picture> findAll();
    List<Picture> findByUserId(Integer paramInteger);
    List<Picture> findByBlogId(Integer paramInteger);
    int delete(Integer paramInteger);
    int update(String paramString);
    List<Picture> findAll2();
    List<Blog> findAll3();
    int deleteByBlogId(Integer paramInteger);
    void updatePicture(@Param("src") String paramString, @Param("userId") Integer paramInteger1, @Param("blogId") Integer paramInteger2);
}
