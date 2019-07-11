package cn.bzerhia.weibo.service;

import cn.bzerhia.weibo.entity.Comment;

public interface CommentService {
    int addComment(Comment comment);
    int addComment2(Comment comment);//楼中楼
}
