package cn.bzerhia.weibo.service;

import cn.bzerhia.weibo.entity.Collect;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CollectService {
    int addCollection(Collect paramCollect);

    List<Collect> findAllByUserId(Integer paramInteger);

    int delete(@Param("userId") Integer paramInteger1, @Param("blogId") Integer paramInteger2);

    Collect findByUserIdAndBlogId(@Param("userId") Integer paramInteger1, @Param("blogId") Integer paramInteger2);

    int deleteByBlogId(Integer paramInteger);
}
