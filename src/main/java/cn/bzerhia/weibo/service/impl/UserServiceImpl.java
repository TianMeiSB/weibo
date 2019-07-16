package cn.bzerhia.weibo.service.impl;

import cn.bzerhia.weibo.entity.User;
import cn.bzerhia.weibo.mapper.UserMapper;
import cn.bzerhia.weibo.service.UserService;
import cn.bzerhia.weibo.util.MyBatisUtil;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl
        implements UserService {
    private MyBatisUtil myBatisUtil;

    public void init() {
        this.session = MyBatisUtil.getSession();
        this.userMapper = (UserMapper) this.session.getMapper(UserMapper.class);
    }

    private UserMapper userMapper;
    private SqlSession session;

    public void close() {
        this.session.commit();
        this.session.close();
    }


    public User findByUsername(String username) {
        init();
        User user = this.userMapper.findByUsername(username);
        close();
        return user;
    }


    public int addUser(User user) {
        init();
        int row = this.userMapper.addUser(user);
        close();
        return row;
    }


    public int updatePasswd(String passwd, Integer userId) {
        init();
        int row = this.userMapper.updatePasswd(passwd, userId);
        close();
        return row;
    }


    public void updateTX(String src, Integer userId) {
        init();
        this.userMapper.updateTX(src, userId);
        close();
    }


    public int updateUser(User user) {
        init();
        int row = this.userMapper.updateUser(user);
        close();
        return row;
    }


    public User findById(Integer userId) {
        init();
        return this.userMapper.findById(userId);
    }


    public List<User> findAll() {
        init();
        List<User> all = this.userMapper.findAll();
        close();
        return all;
    }


    public int updateType(Integer type, Integer userId) {
        init();
        int row = this.userMapper.updateType(type, userId);
        close();
        return row;
    }

    @Override
    public List<User> findByLike(String like) {
        init();
        List<User> userList = userMapper.findByLike(like);
        close();
        return userList;
    }
}
