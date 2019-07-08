package cn.bzerhia.weibo.mapper;

import cn.bzerhia.weibo.entity.User;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserMapper extends BaseMapper<User> {
    User findByUsername(String username);
    int addUser(User user);
    int updatePasswd(@Param("password") String passwd, @Param("userId")Integer userId);
    void updateTX(@Param("src")String image,@Param("userId")Integer userId);
    int updateUser(User user);
    User findById(Integer userId);
}
