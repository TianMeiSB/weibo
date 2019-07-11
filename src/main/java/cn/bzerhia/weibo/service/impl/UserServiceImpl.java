package cn.bzerhia.weibo.service.impl;

import cn.bzerhia.weibo.entity.User;
import cn.bzerhia.weibo.mapper.UserMapper;
import cn.bzerhia.weibo.service.UserService;
import cn.bzerhia.weibo.util.MyBatisUtil;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    private MyBatisUtil myBatisUtil;
    private UserMapper userMapper;
    private SqlSession session;
    public void init(){
        session = MyBatisUtil.getSession();
        userMapper = session.getMapper(UserMapper.class);
    }
    public void close(){
        session.commit();
        session.close();
    }

    @Override
    public User findByUsername(String username) {
        init();
        User user = userMapper.findByUsername(username);
        close();
        return user;
    }

    @Override
    public int addUser(User user) {
        init();
        int row = userMapper.addUser(user);
        close();
        return row;
    }

    @Override
    public int updatePasswd(String passwd,Integer userId) {
        init();
        int row = userMapper.updatePasswd(passwd,userId);
        close();
        return row;
    }

    @Override
    public void updateTX(String src, Integer userId) {
        init();
        userMapper.updateTX(src,userId);
        close();
    }

    @Override
    public int updateUser(User user) {
        init();
        int row = userMapper.updateUser(user);
        close();
        return row;
    }

    @Override
    public User findById(Integer userId) {
        init();
        User user = userMapper.findById(userId);
        return user;
    }

    @Override
    public List<User> findAll() {
        init();
        List<User> all = userMapper.findAll();
        close();
        return all;
    }

    @Override
    public int updateType(Integer type, Integer userId) {
        init();
        int row = userMapper.updateType(type, userId);
        close();
        return row;
    }
}
