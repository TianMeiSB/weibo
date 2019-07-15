package cn.bzerhia.weibo.mapper;

import cn.bzerhia.weibo.entity.Comment;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface CommentMapper extends BaseMapper<Comment> {
    int addComment(Comment paramComment);
    int addComment2(Comment paramComment);
    List<Comment> findAll();
    List<Comment> findAll2();
    List<Comment> findAll3();
    List<Comment> findAllByMasterId(Integer paramInteger);
    List<Comment> findAllByMasterId2(Integer paramInteger);
    List<Comment> findById(@Param("masterId") Integer paramInteger);
    List<Comment> findById2(@Param("masterId") Integer paramInteger);
    void updateComment(Integer paramInteger);
    void updateComment2(Integer paramInteger);
    int delete(Integer paramInteger);
    int delete2(Integer paramInteger);
    int deleteCommentId(Integer paramInteger);
    int deleteByBlogId(Integer paramInteger);
    int deleteByBlogId2(Integer paramInteger);
}
