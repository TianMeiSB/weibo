package cn.bzerhia.weibo.util;

public class MathUtil {
    public static Integer blogId(){
        int id = (int)((Math.random()*9+1)*10000000);
        return id;
    }

    public static void main(String[] args) {
        for(int i=0;i<11;i++){
            Integer integer = blogId();
            System.out.println(integer);
        }
    }
}
