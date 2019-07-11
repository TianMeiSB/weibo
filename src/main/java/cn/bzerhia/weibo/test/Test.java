package cn.bzerhia.weibo.test;

import cn.bzerhia.weibo.entity.*;
import cn.bzerhia.weibo.mapper.BlogMapper;
import cn.bzerhia.weibo.mapper.TypeMapper;
import cn.bzerhia.weibo.mapper.UserMapper;
import cn.bzerhia.weibo.service.BlogService;
import cn.bzerhia.weibo.service.PictureService;
import cn.bzerhia.weibo.service.TypeService;
import cn.bzerhia.weibo.service.impl.BlogServiceImpl;
import cn.bzerhia.weibo.service.impl.PictureServiceImpl;
import cn.bzerhia.weibo.service.impl.TypeServiceImpl;
import cn.bzerhia.weibo.util.MyBatisUtil;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

public class Test {
    private MyBatisUtil myBatisUtil;
    private BlogMapper blogMapper;
    private TypeMapper typeMapper;
    private BlogService blogService;
    private TypeService typeService;
    private PictureService pictureService;
    private SqlSession session;

    public Test() {
        blogService = new BlogServiceImpl();
        typeService = new TypeServiceImpl();
        pictureService = new PictureServiceImpl();
    }

    public void init(){
        session = MyBatisUtil.getSession();
        blogMapper = session.getMapper(BlogMapper.class);
        typeMapper = session.getMapper(TypeMapper.class);
    }
    public void close(){
        session.commit();
        session.close();
    }
    /*public void t1(){
        List<Blog> all = blogService.findAll();
        for (Blog b:all
             ) {
            System.out.println(b);
            System.out.println(b.getUser());
            List<Picture> pictures = b.getPicture();
            for (Picture p:pictures){
                System.out.println(p);
            }
            List<Comment> comments = b.getComment();
            for (Comment c:comments){
                System.out.println(c);
                User user = c.getUser1();
                System.out.println(user);
                List<Comment> comments1 = c.getComments();
                for (Comment c2:comments1){
                    System.out.println(c2);
                }
            }
            System.out.println("======================");
        }
    }*/
   /* public void t2(){
        Blog b = new Blog();
        User u = new User();
        Type type = new Type();
        type.setId(1);
        u.setId(1);
        b.setTitle("111");
        b.setTitlePage("/1/1/1.png");
        b.setText("111111111");
        b.setUserId(2);
        b.setPublishTime(new Date());
        b.setTypeId(2);
        blogMapper.addBlog(b);
    }*/
   public  void t3(){
       List<Type> all = typeService.findAll();
       for (Type type:all){
           System.out.println(type);
       }
   }

   public void t4(){
       List<Blog> byPhoto = blogService.findByPhoto(1);
       for (Blog picture:byPhoto){
           System.out.println(picture);
           List<Picture> picture1 = picture.getPicture();
           for (Picture pi:picture1){
               System.out.println(pi);
           }
       }
   }
    public void t5(){
        Blog byId = blogService.findById(40478005);
        List<Comment> comment = byId.getComment();
        for (Comment c:comment){
            System.out.println(c);
            System.out.println(c.getUser1());
            List<Comment> comments = c.getComments();
            for (Comment c2:comments){
                System.out.println(c2);
                System.out.println( c2.getUser1());
            }

        }
    }

    public static void main(String[] args) {
        Test test = new Test();
//        test.t1();
//        test.t2();
//        test.t3();
        test.t5();
    }
}
