package cn.bzerhia.weibo.entity;

import lombok.Data;

@Data
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
