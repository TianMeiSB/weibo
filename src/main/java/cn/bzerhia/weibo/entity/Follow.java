package cn.bzerhia.weibo.entity;

import lombok.Data;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Data
public class Follow {
    private Integer id;
    private Integer userId;
    private Integer followUserId;
    private Date createTime;
    private List<User> user = new ArrayList<User>();
    private List<User> followUser= new ArrayList<User>();
}
