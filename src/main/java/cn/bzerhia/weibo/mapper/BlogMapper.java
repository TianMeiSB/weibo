package cn.bzerhia.weibo.mapper;

import cn.bzerhia.weibo.entity.Blog;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BlogMapper {
   List<Blog> findAll();
   int addBlog(Blog blog);
   Blog findByTitle(String title);
   Blog findById(Integer id);
   List<Blog> findByPhoto();
}
