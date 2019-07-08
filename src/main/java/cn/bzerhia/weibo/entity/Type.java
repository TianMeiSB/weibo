package cn.bzerhia.weibo.entity;

import com.baomidou.mybatisplus.annotations.TableName;
import lombok.Data;

@Data
@TableName("t_type")
public class Type {
    private Integer id;
    private String classification;

    @Override
    public String toString() {
        return "Type{" +
                "id=" + id +
                ", classification='" + classification + '\'' +
                '}';
    }
}
