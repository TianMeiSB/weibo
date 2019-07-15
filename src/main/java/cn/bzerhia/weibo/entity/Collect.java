package cn.bzerhia.weibo.entity;

import com.baomidou.mybatisplus.annotations.TableName;
import lombok.Data;

import java.util.Date;

@Data
@TableName("t_collect")
public class Collect {
    private Integer id;
    private Integer userId;
    private Integer blogId;
    private Date collTime;
    private Blog blog;
    private User user;
}
