package cn.bzerhia.weibo.mapper;

import cn.bzerhia.weibo.entity.Type;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface TypeMapper {
    List<Type> findAll();
    int addType(Type type);
    int update(Type type);
    int delete(Integer typeId);
}
