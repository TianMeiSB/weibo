package cn.bzerhia.weibo.service;

import cn.bzerhia.weibo.entity.Blog;

import java.util.List;

public interface BlogService {
    List<Blog> findAll();
    int addBlog(Blog blog);
    Blog findByTitle(String title);
    Blog findById(Integer id);
    List<Blog> findByPhoto();
}
