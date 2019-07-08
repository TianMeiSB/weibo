package cn.bzerhia.weibo.entity;

import com.baomidou.mybatisplus.annotations.TableName;
import lombok.Data;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 帖子表
 */
@Data
@TableName("t_blog")
public class Blog {
    private Integer id;
    private String title;//标题
    private String titlePage;//封面
    private String text;//正文
    private List<Comment> comment = new ArrayList<Comment>();//评论
    private User user;//用户
    private Date publishTime;//发表时间
    private Type type;//帖子类型
    private Integer userId;//用户ID
    private Integer typeId;//类型ID
//    private Picture picture;//图片
    private List<Picture> picture = new ArrayList<Picture>();//图片
    private Integer blogType;//


    @Override
    public String toString() {
        return "Blog{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", titlePage='" + titlePage + '\'' +
                ", text='" + text + '\'' +
                ", publishTime=" + publishTime +
                ", type='" + type + '\'' +
                '}';
    }
}
