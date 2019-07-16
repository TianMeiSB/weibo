package cn.bzerhia.weibo.controller;

import cn.bzerhia.weibo.constant.Constant;
import cn.bzerhia.weibo.entity.*;
import cn.bzerhia.weibo.service.*;
import cn.bzerhia.weibo.service.impl.*;
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
    private UserService userService = new UserServiceImpl();
    private PictureService pictureService = new PictureServiceImpl();
    private BlogService blogService = new BlogServiceImpl();
    private TypeService typeService = new TypeServiceImpl();
    private CommentService commentService = new CommentServiceImpl();
    private FollowService followService = new FollowServiceImpl();


    @GetMapping({"index"})
    public String index() {
        return "redirect:findByType?typeId=1";
    }


    public void util(HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return;
        }
        List<Comment> comments = this.commentService.findAllByMasterId(user.getId());
        List<Comment> comments2 = this.commentService.findAllByMasterId2(user.getId());
        session.setAttribute("comments", comments);
        session.setAttribute("comments2", comments2);
    }

    @GetMapping({"admin"})
    public String admin(HttpSession session) {
        User user = (User) session.getAttribute("user");
        if(user==null){
            return "redirect:findByType?typeId=1";
        }
        if (user.getType().intValue() != 1) {
            return "redirect:findByType?typeId=1";
        }
        return "admin/index";
    }

    @GetMapping({"user/seeComment"})
    public String seeComment(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:findByType?typeId=1";
        }
        List<Comment> list = this.commentService.findById(user.getId());
        List<Comment> list2 = this.commentService.findById2(user.getId());
        model.addAttribute("commentList", list);
        model.addAttribute("commentList2", list2);
        this.commentService.updateComment(user.getId());
        this.commentService.updateComment2(user.getId());
        return "user/seeComment";
    }

    @GetMapping({"login"})
    public String login() {
        return "login";
    }


    @GetMapping({"register"})
    public String register() {
        return "register";
    }

    @GetMapping({"user/myIndex"})
    public String myIndex(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:findByType?typeId=1";
        }
        List<Blog> blogList = this.blogService.findByUserId(user.getId());
        List<Follow> followList = this.followService.findAllByUserId(user.getId());
        List<Follow> followList1 = this.followService.findAllByFollowUserId(user.getId());
        model.addAttribute("blogList", blogList);
        model.addAttribute("guanzhu", followList);
        model.addAttribute("fensi", followList1);
        model.addAttribute("code", Integer.valueOf(1));
        return "user/myIndex";
    }

    @GetMapping({"findByLike"})
    public String findByLike(HttpSession session, Model model, String like) {
        if (like==null||like.equals("")) {
            return "redirect:findByType?typeId=1";
        }
        String src = "%" + like + "%";
        List<Blog> blogList = this.blogService.findByLike(src);
        List<User> userList = userService.findByLike(src);
        model.addAttribute("blogList", blogList);
        model.addAttribute("userList",userList);
        model.addAttribute("like",like);
        return "search";
    }

    @GetMapping({"user/myIndex2"})
    public String myIndex2(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:findByType?typeId=1";
        }
        List<Blog> blogList = this.blogService.findByUserId2(user.getId());
        List<Follow> followList = this.followService.findAllByUserId(user.getId());
        List<Follow> followList1 = this.followService.findAllByFollowUserId(user.getId());
        model.addAttribute("blogList", blogList);
        model.addAttribute("guanzhu", followList);
        model.addAttribute("fensi", followList1);
        model.addAttribute("code", Integer.valueOf(2));
        return "user/myIndex";
    }

    @GetMapping({"Index"})
    public String index2(Integer userId, HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (userId == null) {
            return "redirect:findByType?typeId=1";
        }
        User byUserId = this.userService.findById(userId);
        List<Blog> blogList = this.blogService.findByUserId(userId);
        List<Follow> followList = this.followService.findAllByUserId(userId);
        List<Follow> followList1 = this.followService.findAllByFollowUserId(userId);
        Follow follow = null;
        if (user != null) {
            if (userId == user.getId()) {
                model.addAttribute("blogList", blogList);
                model.addAttribute("guanzhu", followList);
                model.addAttribute("fensi", followList1);
                return "user/myIndex";
            }
            follow = this.followService.findByUserIdAndFollowUserId(user.getId(), userId);
        }
        model.addAttribute("byUserId", byUserId);
        model.addAttribute("blogList", blogList);
        model.addAttribute("follow", follow);
        model.addAttribute("guanzhu", followList);
        model.addAttribute("fensi", followList1);
        return "user/uIndex";
    }

    @GetMapping({"album"})
    public String album(HttpSession session, Integer userId, Model model) {
        User user = (User) session.getAttribute("user");
        User user1 = this.userService.findById(userId);
        List<Picture> pictures = this.pictureService.findByUserId(userId);
        if (user != null &&
                user.getId() == user1.getId()) {
            model.addAttribute("picture", pictures);
            return "user/myAlbum";
        }

        model.addAttribute("user1", user1);
        model.addAttribute("picture", pictures);
        return "user/uAlbum";
    }

    @GetMapping({"user/myInformation"})
    public String myInformation(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:findByType?typeId=1";
        }
        List<Blog> blogList = this.blogService.findByUserId(user.getId());
        List<Follow> followList = this.followService.findAllByUserId(user.getId());
        List<Follow> followList1 = this.followService.findAllByFollowUserId(user.getId());
        model.addAttribute("blogList", blogList);
        model.addAttribute("guanzhu", followList);
        model.addAttribute("fensi", followList1);
        return "user/myInformation";
    }

    @GetMapping({"user/myAlbum"})
    public String myAlbum(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:findByType?typeId=1";
        }
        List<Picture> pictures = this.pictureService.findByUserId(user.getId());
        model.addAttribute("picture", pictures);
        return "user/myAlbum";
    }


    @PostMapping({"login"})
    public void login(String username, String password, HttpServletRequest request, HttpServletResponse response) throws IOException {
        if (username == null || username.equals("") || password == null || password.equals("")) {
            response.getWriter().write("err1");
            return;
        }
        User user = this.userService.findByUsername(username);
        if (user == null) {
            response.getWriter().write("err3");
            return;
        }
        if (user.getType().intValue() == 3) {
            response.getWriter().write("err4");
        } else if (MD5Utils.getSaltverifyMD5(password, user.getPassword())) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            response.getWriter().write("ok");
            System.out.println("登陆成功");
        } else {
            response.getWriter().write("err2");
            request.setAttribute("error", "密码错误，请重新输入！");
            System.out.println("密码错误，请重新输入！");
        }
    }


    @GetMapping({"logout"})
    public String logout(HttpSession session) {
        session.invalidate();
        UploadController.remove();
        return "redirect:findByType?typeId=1";
    }


    @PostMapping({"register"})
    public void register(String username, String password, String sex, String phone, String address, HttpServletResponse response, String email, String code, HttpSession session) throws IOException {
        User user = null;
        if (username == null || username.equals("") || password == null || password
                .equals("") || sex == null || sex
                .equals("") || phone == null || phone
                .equals("") || address == null || address
                .equals("") || email == null || email
                .equals("") || code == null || code
                .equals("")) {
            response.getWriter().write("err1");
            return;
        }
        String code1 = (String) session.getAttribute("validCode");
        if (code1 == null) {
            return;
        }
        if (code1.equals(code)) {
            user = this.userService.findByUsername(username);
            if (user == null) {
                user = new User();
                user.setUsername(username);
                String cipherPassword = MD5Utils.getSaltMD5(password);
                user.setPassword(cipherPassword);
                user.setSex(sex);
                user.setPhone(phone);
                user.setAddress(address);
                user.setType(Integer.valueOf(0));
                user.setIntroduce("一句话介绍下自己吧，让别人更了解你");
                user.setRegisterTime(new Date());
                user.setSalt(cipherPassword);
                user.setEmail(email);
                user.setImage(Constant.HEADSHOT_TOUXIANG);
                int row = this.userService.addUser(user);
                if (row > 0) {
                    response.getWriter().write("ok");
                    session.removeAttribute("validCode");
                } else {
                    response.getWriter().write("err3");
                }
            } else {
                response.getWriter().write("err2");
            }
        } else {
            response.getWriter().write("err4");
        }
    }


    @PostMapping({"updatePasswd"})
    public void updatePasswd(String passwd1, String passwd2, Integer userId, HttpServletResponse response, HttpSession session) throws IOException {
        User user = (User) session.getAttribute("user");
        if (MD5Utils.getSaltverifyMD5(passwd1, user.getPassword())) {
            if (passwd2 == null || passwd2.equals("")) {
                response.getWriter().write("error3");
                return;
            }
            String passwd = MD5Utils.getSaltMD5(passwd2);
            int row = this.userService.updatePasswd(passwd, userId);
            if (row > 0) {
                response.getWriter().write("ok");
                System.out.println("修改成功");
                session.invalidate();
            } else {
                response.getWriter().write("error2");
            }
        } else {
            response.getWriter().write("error");
            System.out.println("密码错误");
        }
    }


    @PostMapping({"userUpdate"})
    public void update(String address, String phone, String sex, String introduce, Integer userId, HttpServletResponse response, HttpSession session) throws IOException {
        if (address == null || address.equals("") || phone == null || phone
                .equals("") || sex == null || sex
                .equals("") || introduce == null || introduce
                .equals("") || userId == null) {

            response.getWriter().write("error");
            return;
        }
        User user = new User();
        user.setId(userId);
        user.setAddress(address);
        user.setPhone(phone);
        user.setSex(sex);
        user.setIntroduce(introduce);
        int row = this.userService.updateUser(user);
        User user1 = this.userService.findById(userId);
        session.setAttribute("user", user1);
        if (row > 0) {
            response.getWriter().write("ok");
        } else {
            response.getWriter().write("error2");
        }
    }

    @PostMapping({"updateType"})
    public void updateType(Integer type, Integer userId, HttpServletResponse response) throws IOException {
        if (type == null || userId == null) {
            response.getWriter().write("error");
            return;
        }
        int row = this.userService.updateType(type, userId);
        if (row > 0) {
            response.getWriter().write("ok");
        } else {
            response.getWriter().write("error");
        }
    }
}
