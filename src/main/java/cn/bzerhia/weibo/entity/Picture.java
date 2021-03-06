package cn.bzerhia.weibo.entity;

import com.baomidou.mybatisplus.annotations.TableName;
import lombok.Data;

import java.util.ArrayList;
import java.util.List;

@Data
@TableName("t_picture")
public class Picture {
    private Integer id;
    private String src;
    private Integer userId;
    private Integer blogId;
    private User user;
    private List<Blog> blog = new ArrayList<Blog>();

    @Override
    public String toString() {
        return "Picture{" +
                "id=" + id +
                ", src='" + src + '\'' +
                ", userId=" + userId +
                ", blogId=" + blogId +
                ", user=" + user +
                ", blog=" + blog +
                '}';
    }
}
