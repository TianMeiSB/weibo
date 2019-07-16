package cn.bzerhia.weibo.mapper;

import cn.bzerhia.weibo.entity.Blog;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BlogMapper extends BaseMapper<Blog> {
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
    List<Blog> findByLike(@Param("like") String like);
    List<Blog> findByTime();
    List<Blog> findByType(Integer paramInteger);
    List<Blog> findByType2();
    int delete(Integer paramInteger);
    int update(Blog paramBlog);
    void updateTitlePage(@Param("titlePage") String paramString, @Param("blogId") Integer paramInteger);
    Blog findById2(Integer paramInteger);
    int updateBlogType(@Param("blogId") Integer paramInteger1, @Param("typeId") Integer paramInteger2);
}
