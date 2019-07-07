package cn.bzerhia.weibo.service;

import cn.bzerhia.weibo.entity.Type;

import java.util.List;

public interface TypeService {
    List<Type> findAll();
    int addType(Type type);
    int update(Type type);
    int delete(Integer typeId);
}
