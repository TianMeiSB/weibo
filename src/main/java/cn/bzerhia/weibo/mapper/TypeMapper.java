package cn.bzerhia.weibo.mapper;

import cn.bzerhia.weibo.entity.Type;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface TypeMapper extends BaseMapper<Type> {
    List<Type> findAll();
    List<Type> findAll2();
    int addType(Type type);
    int update(Type type);
    int delete(Integer typeId);
}
