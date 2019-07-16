package cn.bzerhia.weibo.service;

import cn.bzerhia.weibo.entity.User;

import java.util.List;

public interface UserService {
    User findByUsername(String paramString);

    int addUser(User paramUser);

    int updatePasswd(String paramString, Integer paramInteger);

    void updateTX(String paramString, Integer paramInteger);

    int updateUser(User paramUser);

    User findById(Integer paramInteger);

    List<User> findAll();

    int updateType(Integer paramInteger1, Integer paramInteger2);
    List<User> findByLike(String like);
}
