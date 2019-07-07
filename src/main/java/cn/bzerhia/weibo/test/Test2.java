package cn.bzerhia.weibo.test;

public class Test2 {
    public static void main(String args[]){
        int value = Test2.getValue(2);
        System.out.println(value);
    }
    public static int getValue(int i) {
        int result = 0;
        switch (i) {
            case 1:
                result = result + i;
            case 2:
                result = result + i * 2;
            case 3:
                result = result + i * 3;
        }
        return result;
    }
}
