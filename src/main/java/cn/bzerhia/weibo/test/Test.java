package cn.bzerhia.weibo.test;

import cn.bzerhia.weibo.entity.Blog;
import cn.bzerhia.weibo.entity.Comment;
import cn.bzerhia.weibo.entity.Picture;
import cn.bzerhia.weibo.entity.Type;
import cn.bzerhia.weibo.mapper.BlogMapper;
import cn.bzerhia.weibo.mapper.TypeMapper;
import cn.bzerhia.weibo.service.BlogService;
import cn.bzerhia.weibo.service.PictureService;
import cn.bzerhia.weibo.service.TypeService;
import cn.bzerhia.weibo.service.impl.BlogServiceImpl;
import cn.bzerhia.weibo.service.impl.PictureServiceImpl;
import cn.bzerhia.weibo.service.impl.TypeServiceImpl;
import cn.bzerhia.weibo.util.MyBatisUtil;
import org.apache.ibatis.session.SqlSession;

import java.util.List;






public class Test
{
    private MyBatisUtil myBatisUtil;
    private BlogMapper blogMapper;
    private TypeMapper typeMapper;
    private BlogService blogService = new BlogServiceImpl();
    private TypeService typeService = new TypeServiceImpl();
    private PictureService pictureService = new PictureServiceImpl();
    private SqlSession session;

    public void init() {
        this.session = MyBatisUtil.getSession();
        this.blogMapper = (BlogMapper)this.session.getMapper(BlogMapper.class);
        this.typeMapper = (TypeMapper)this.session.getMapper(TypeMapper.class);
    }
    public void close() {
        this.session.commit();
        this.session.close();
    }





































    public void t3() {
        List<Type> all = this.typeService.findAll();
        for (Type type : all) {
            System.out.println(type);
        }
    }

    public void t4() {
        List<Blog> byPhoto = this.blogService.findByPhoto(Integer.valueOf(1));
        for (Blog picture : byPhoto) {
            System.out.println(picture);
            List<Picture> picture1 = picture.getPicture();
            for (Picture pi : picture1)
                System.out.println(pi);
        }
    }

    public void t5() {
        Blog byId = this.blogService.findById(Integer.valueOf(40478005));
        List<Comment> comment = byId.getComment();
        for (Comment c : comment) {
            System.out.println(c);
            System.out.println(c.getUser1());
            List<Comment> comments = c.getComments();
            for (Comment c2 : comments) {
                System.out.println(c2);
                System.out.println(c2.getUser1());
            }
        }
    }


    public static void main(String[] args) {
        Test test = new Test();



        test.t5();
    }
}
