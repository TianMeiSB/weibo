package cn.bzerhia.weibo.service;

import cn.bzerhia.weibo.entity.Like;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface LikeService {
    int addLike(Like paramLike);

    List<Like> findAllByBlogId(Integer paramInteger);

    int delete(@Param("userId") Integer paramInteger1, @Param("blogId") Integer paramInteger2);

    Like findByUserIdAndBlogId(@Param("userId") Integer paramInteger1, @Param("blogId") Integer paramInteger2);

    int deleteByBlogId(Integer paramInteger);
}
