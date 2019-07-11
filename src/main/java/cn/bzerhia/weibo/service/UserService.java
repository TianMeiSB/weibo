package cn.bzerhia.weibo.service;

import cn.bzerhia.weibo.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import java.util.List;

public interface UserService {
    User findByUsername(String username);
    int addUser(User user);
    int updatePasswd(String passwd,Integer userId);
    void updateTX(String src,Integer userId);
    int updateUser(User user);
    User findById(Integer userId);
    List<User> findAll();
    int updateType(Integer type,Integer userId);
}
