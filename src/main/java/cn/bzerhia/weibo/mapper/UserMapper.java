package cn.bzerhia.weibo.mapper;

import cn.bzerhia.weibo.entity.User;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserMapper extends BaseMapper<User> {
    User findByUsername(String paramString);
    int addUser(User paramUser);
    int updatePasswd(@Param("password") String paramString, @Param("userId") Integer paramInteger);
    void updateTX(@Param("src") String paramString, @Param("userId") Integer paramInteger);
    int updateUser(User paramUser);
    User findById(Integer paramInteger);
    List<User> findAll();
    int updateType(@Param("type") Integer paramInteger1, @Param("userId") Integer paramInteger2);
}
