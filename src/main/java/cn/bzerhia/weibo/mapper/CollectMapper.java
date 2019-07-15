package cn.bzerhia.weibo.mapper;

import cn.bzerhia.weibo.entity.Collect;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CollectMapper {
    int addCollection(Collect paramCollect);
    List<Collect> findAllByUserId(Integer paramInteger);
    int delete(@Param("userId") Integer paramInteger1, @Param("blogId") Integer paramInteger2);
    Collect findByUserIdAndBlogId(@Param("userId") Integer paramInteger1, @Param("blogId") Integer paramInteger2);
    int deleteByBlogId(Integer paramInteger);
}
