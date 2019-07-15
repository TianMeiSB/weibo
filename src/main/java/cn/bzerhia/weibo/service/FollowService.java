package cn.bzerhia.weibo.service;

import cn.bzerhia.weibo.entity.Follow;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface FollowService {
    int addFollow(Follow paramFollow);

    List<Follow> findAllByUserId(Integer paramInteger);

    List<Follow> findAllByFollowUserId(Integer paramInteger);

    int delete(@Param("userId") Integer paramInteger1, @Param("followUserId") Integer paramInteger2);

    Follow findByUserIdAndFollowUserId(@Param("userId") Integer paramInteger1, @Param("followUserId") Integer paramInteger2);
}
