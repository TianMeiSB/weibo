package cn.bzerhia.weibo.service;

import cn.bzerhia.weibo.entity.Type;
import java.util.List;

public interface TypeService {
    List<Type> findAll();

    List<Type> findAll2();

    int addType(Type paramType);

    int update(Type paramType);

    int delete(Integer paramInteger);
}
