package cn.bzerhia.weibo.service;

import cn.bzerhia.weibo.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Service;

public interface UserService {
    User findByUsername(String username);
    int addUser(User user);
    int updatePasswd(String passwd,Integer userId);
    void updateTX(String src,Integer userId);
    int updateUser(User user);
    User findById(Integer userId);
}
