package cn.bzerhia.weibo.service;

import cn.bzerhia.weibo.entity.Blog;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BlogService {
    List<Blog> findAll();

    List<Blog> findAll2();

    List<Blog> findAll3();

    int addBlog(Blog paramBlog);

    Blog findByTitle(String paramString);

    Blog findById(Integer paramInteger);

    List<Blog> findAllByPhoto();

    List<Blog> findByPhoto(Integer paramInteger);

    List<Blog> findByUserId(Integer paramInteger);

    List<Blog> findByUserId2(Integer paramInteger);

    List<Blog> findByLike(String paramString, Integer paramInteger);

    List<Blog> findByTime();

    List<Blog> findByType(Integer paramInteger);

    List<Blog> findByType2();

    int delete(Integer paramInteger);

    int update(Blog paramBlog);

    void updateTitlePage(@Param("titlePage") String paramString, @Param("blogId") Integer paramInteger);

    Blog findById2(Integer paramInteger);

    int updateBlogType(Integer paramInteger1, Integer paramInteger2);
}
