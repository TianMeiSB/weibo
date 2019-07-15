package cn.bzerhia.weibo.entity;

import lombok.Data;

import java.util.Date;

@Data
public class Like {
    private Integer id;
    private Integer userId;
    private Integer blogId;
    private Date createTime;
}
