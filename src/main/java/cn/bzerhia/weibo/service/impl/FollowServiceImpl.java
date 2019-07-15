package cn.bzerhia.weibo.service.impl;

import cn.bzerhia.weibo.entity.Follow;
import cn.bzerhia.weibo.mapper.FollowMapper;
import cn.bzerhia.weibo.service.FollowService;
import cn.bzerhia.weibo.util.MyBatisUtil;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FollowServiceImpl
        implements FollowService {
    private MyBatisUtil myBatisUtil;

    public void init() {
        this.session = MyBatisUtil.getSession();
        this.followMapper = (FollowMapper)this.session.getMapper(FollowMapper.class);
    } private FollowMapper followMapper; private SqlSession session;
    public void close() {
        this.session.commit();
        this.session.close();
    }


    public int addFollow(Follow follow) {
        init();
        int row = this.followMapper.addFollow(follow);
        close();
        return row;
    }


    public List<Follow> findAllByUserId(Integer userId) {
        init();
        List<Follow> followList = this.followMapper.findAllByUserId(userId);
        close();
        return followList;
    }


    public List<Follow> findAllByFollowUserId(Integer followUserId) {
        init();
        List<Follow> list = this.followMapper.findAllByFollowUserId(followUserId);
        close();
        return list;
    }


    public int delete(Integer userId, Integer followUserId) {
        init();
        int row = this.followMapper.delete(userId, followUserId);
        close();
        return row;
    }


    public Follow findByUserIdAndFollowUserId(Integer userId, Integer followUserId) {
        init();
        Follow follow = this.followMapper.findByUserIdAndFollowUserId(userId, followUserId);
        close();
        return follow;
    }
}
