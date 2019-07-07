package cn.bzerhia.weibo.entity;

import lombok.Data;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 评论类
 */
@Data
public class Comment {
    private Integer id;
    private User user;//评论的用户信息
    private Blog blog;//帖子信息
    private Integer userId;//用户ID
    private Integer blogId;//帖子ID
    private String text;//评论内容
    private Date replyTime;//评论时间
    private String picture;//评论图片
    private List<Comment> comments = new ArrayList<Comment>();//楼中楼

    @Override
    public String toString() {
        return "Comment{" +
                "id=" + id +
                ", text='" + text + '\'' +
                ", replyTime=" + replyTime +
                ", picture='" + picture + '\'' +
                '}';
    }
}
