package cn.bzerhia.weibo.mapper;

import cn.bzerhia.weibo.entity.Blog;
import cn.bzerhia.weibo.entity.Comment;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.springframework.stereotype.Repository;

@Repository
public interface CommentMapper extends BaseMapper<Comment> {
    int addComment(Comment comment);
    int addComment2(Comment comment);//楼中楼
}
