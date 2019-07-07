package cn.bzerhia.weibo.util;

public class MathUtil {
    public static Integer blogId(){
        int id = (int)((Math.random()*9+1)*10000000);
        return id;
    }
}
