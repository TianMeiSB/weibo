package cn.bzerhia.weibo.mapper;

import cn.bzerhia.weibo.entity.Like;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface LikeMapper {
    int addLike(Like paramLike);
    List<Like> findAllByBlogId(Integer paramInteger);
    int delete(@Param("userId") Integer paramInteger1, @Param("blogId") Integer paramInteger2);
    Like findByUserIdAndBlogId(@Param("userId") Integer paramInteger1, @Param("blogId") Integer paramInteger2);
    int deleteByBlogId(Integer paramInteger);
}
