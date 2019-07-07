package cn.bzerhia.weibo.entity;

import lombok.Data;

import java.util.Date;
@Data
public class User {
    private Integer id;
    private String username;
    private String password;
    private String sex;
    private String phone;
    private Integer type;
    private String address;
    private Date registerTime;
    private String salt;
    private String image;
    private String introduce;
}
