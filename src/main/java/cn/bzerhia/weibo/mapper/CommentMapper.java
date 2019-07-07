package cn.bzerhia.weibo.mapper;

import cn.bzerhia.weibo.entity.Comment;
import org.springframework.stereotype.Repository;

@Repository
public interface CommentMapper {
    int addComment(Comment comment);
}
