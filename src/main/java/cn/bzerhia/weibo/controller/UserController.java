package cn.bzerhia.weibo.controller;
import cn.bzerhia.weibo.constant.Constant;
import cn.bzerhia.weibo.entity.Blog;
import cn.bzerhia.weibo.entity.Picture;
import cn.bzerhia.weibo.entity.Type;
import cn.bzerhia.weibo.entity.User;
import cn.bzerhia.weibo.service.BlogService;
import cn.bzerhia.weibo.service.PictureService;
import cn.bzerhia.weibo.service.TypeService;
import cn.bzerhia.weibo.service.UserService;
import cn.bzerhia.weibo.service.impl.BlogServiceImpl;
import cn.bzerhia.weibo.service.impl.PictureServiceImpl;
import cn.bzerhia.weibo.service.impl.TypeServiceImpl;
import cn.bzerhia.weibo.service.impl.UserServiceImpl;
import cn.bzerhia.weibo.util.MD5Utils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@Controller
public class UserController {
    private UserService userService;
    private PictureService pictureService;
    private BlogService blogService;
    private TypeService typeService;

    public UserController() {
        userService = new UserServiceImpl();
        pictureService = new PictureServiceImpl();
        blogService = new BlogServiceImpl();
        typeService = new TypeServiceImpl();
    }
    @GetMapping("index")
    public String index(Model model){
        List<Blog> blogList = blogService.findAll2();
        List<Type> typeList = typeService.findAll2();
        model.addAttribute("blogList",blogList);
        model.addAttribute("typeList",typeList);
        return "index";
    }
    @GetMapping("admin")
    public String admin(HttpSession session){
        User user = (User)session.getAttribute("user");
        if (user.getType()!=1){
            return "redirect:index";
        }else {
            return "admin/index";
        }
    }
    @GetMapping("login")
    public String login(){
        return "login";
    }
    @GetMapping("register")
    public String register(){
        return "register";
    }
    @GetMapping("user/myIndex")
    public String myIndex(HttpSession session,Model model){
        User user = (User)session.getAttribute("user");
        if(user==null){
            return "redirect:index";
        }else{
            List<Blog> blogList = blogService.findByUserId(user.getId());
            model.addAttribute("blogList",blogList);
            return "user/myIndex";
        }
    }
    @GetMapping("Index")
    public String index2(Integer userId,HttpSession session,Model model){
        User user = (User)session.getAttribute("user");
        User byUserId = userService.findById(userId);
        List<Blog> blogList = blogService.findByUserId(userId);
        if(user!=null){
            if(userId==user.getId()){
                model.addAttribute("blogList",blogList);
                return "user/myIndex";
            }
        }
        model.addAttribute("byUserId",byUserId);
        model.addAttribute("blogList",blogList);
        return "user/uIndex";

    }
    @GetMapping("album")
    public String album(HttpSession session,Integer userId,Model model){
        User user = (User)session.getAttribute("user");
        User user1 = userService.findById(userId);
        List<Picture> pictures = pictureService.findByUserId(userId);
        if(user!=null){
            if (user.getId()==user1.getId()){
                model.addAttribute("picture",pictures);
                return "user/myAlbum";
            }
        }
        model.addAttribute("user1",user1);
        model.addAttribute("picture",pictures);
        return "user/uAlbum";
    }
    @GetMapping("user/myInformation")
    public String myInformation(HttpSession session,Model model){
        User user = (User)session.getAttribute("user");
        if(user==null){
            return "redirect:index";
        }else{
            List<Blog> blogList = blogService.findByUserId(user.getId());
            model.addAttribute("blogList",blogList);
            return "user/myInformation";
        }
    }
    @GetMapping("user/myAlbum")
    public String myAlbum(HttpSession session,Model model){
        User user = (User)session.getAttribute("user");
        if(user==null){
            return "redirect:index";
        }else{
            List<Picture> pictures = pictureService.findByUserId(user.getId());
            model.addAttribute("picture",pictures);
            return "user/myAlbum";
        }
    }
    @PostMapping("login")
    public void login(String username, String password , HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        if(username==null||username.equals("")||password==null||password.equals("")){
            response.getWriter().write("err1");
            return;
        }
        User user = userService.findByUsername(username);
        if(user.getType()==3){
            response.getWriter().write("err4");
            return;
        }
        if (user==null){
            response.getWriter().write("err3");
        }else{
//            if(user.getPassword().equals(password)){
            if( MD5Utils.getSaltverifyMD5(password, user.getPassword())){
                HttpSession session = request.getSession();
                session.setAttribute("user",user);
                response.getWriter().write("ok");
                System.out.println("登陆成功!");
            }else{
                response.getWriter().write("err2");
                request.setAttribute("error","密码错误，请重新输入！");
                System.out.println("密码错误，请重新输入!");
            }
        }
    }

    @GetMapping("logout")
    public String logout(HttpSession session){
        session.invalidate();
        UploadController.remove();
        return "redirect:index";
    }


    @PostMapping("register")
    public void register(String username,String password,String sex,String phone,String address,HttpServletResponse response)
            throws IOException{
        User user = null;
        if(username==null||username.equals("")||
                password==null||password.equals("")||
                sex==null||sex.equals("")||
                phone==null||phone.equals("")||
                address==null||address.equals("")){
            response.getWriter().write("err1");
            return;
        }
       user = userService.findByUsername(username);
        if(user==null){
            user = new User();
            user.setUsername(username);
            String cipherPassword = MD5Utils.getSaltMD5(password);
            user.setPassword(cipherPassword);
            user.setSex(sex);
            user.setPhone(phone);
            user.setAddress(address);
            user.setType(0);
            user.setIntroduce("一句话介绍一下自己吧，让别人更了解你");
            user.setRegisterTime(new Date());
            user.setSalt(cipherPassword);
            user.setImage(Constant.HEADSHOT_TOUXIANG);
            int row = userService.addUser(user);
            if(row>0){
                response.getWriter().write("ok");
            }else{
                response.getWriter().write("err3");
            }
        }else{
            response.getWriter().write("err2");
        }
    }

    @PostMapping("updatePasswd")
    public void updatePasswd(String passwd1,String passwd2,Integer userId,HttpServletResponse response,HttpSession session)
            throws IOException{
        User user = (User)session.getAttribute("user");
        if (MD5Utils.getSaltverifyMD5(passwd1, user.getPassword())){
            if (passwd2==null||passwd2.equals("")){
                response.getWriter().write("error3");
                return;
            }
            String passwd = MD5Utils.getSaltMD5(passwd2);
            int row = userService.updatePasswd(passwd, userId);
            if (row>0) {
                response.getWriter().write("ok");
                System.out.println("修改成功");
                session.invalidate();
            }else{
                response.getWriter().write("error2");
            }
        }else{
            response.getWriter().write("error");
            System.out.println("密码错误");
        }
    }

    @PostMapping("userUpdate")
    public void update(String address,String phone,String sex,String introduce,Integer userId,HttpServletResponse response,HttpSession session)
            throws IOException{
        if(address==null||address.equals("")||
                phone==null||phone.equals("")||
                sex==null||sex.equals("")||
                introduce==null||introduce.equals("")||
                userId==null){
            response.getWriter().write("error");
            return;
        }
        User user = new User();
        user.setId(userId);
        user.setAddress(address);
        user.setPhone(phone);
        user.setSex(sex);
        user.setIntroduce(introduce);
        int row = userService.updateUser(user);
        User user1 = userService.findById(userId);
        session.setAttribute("user",user1);
        if (row>0){
            response.getWriter().write("ok");
        }else{
            response.getWriter().write("error2");
        }
    }
    @PostMapping("updateType")
    public void updateType(Integer type,Integer userId,HttpServletResponse response)
            throws IOException{
        if (type==null||userId==null){
            response.getWriter().write("error");
            return;
        }
        int row = userService.updateType(type, userId);
        if (row>0){
            response.getWriter().write("ok");
        }else{
            response.getWriter().write("error");
        }
    }
}
