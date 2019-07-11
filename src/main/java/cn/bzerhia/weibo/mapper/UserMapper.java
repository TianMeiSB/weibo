package cn.bzerhia.weibo.mapper;

import cn.bzerhia.weibo.entity.User;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserMapper extends BaseMapper<User> {
    User findByUsername(String username);
    int addUser(User user);
    int updatePasswd(@Param("password") String passwd, @Param("userId")Integer userId);
    void updateTX(@Param("src")String image,@Param("userId")Integer userId);
    int updateUser(User user);
    User findById(Integer userId);
    List<User> findAll();
    int updateType(@Param("type")Integer type,@Param("userId")Integer userId);
}
