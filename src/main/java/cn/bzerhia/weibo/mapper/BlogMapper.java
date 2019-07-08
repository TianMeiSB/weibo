package cn.bzerhia.weibo.mapper;

import cn.bzerhia.weibo.entity.Blog;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BlogMapper extends BaseMapper<Blog> {
   List<Blog> findAll();
   int addBlog(Blog blog);
   Blog findByTitle(String title);
   Blog findById(Integer id);
   List<Blog> findAllByPhoto();
   List<Blog> findByPhoto(Integer userId);
   List<Blog> findByUserId(Integer userId);
}
