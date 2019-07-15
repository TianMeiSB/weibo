package cn.bzerhia.weibo.controller;

import cn.bzerhia.weibo.constant.Constant;
import cn.bzerhia.weibo.entity.Picture;
import cn.bzerhia.weibo.entity.User;
import cn.bzerhia.weibo.service.BlogService;
import cn.bzerhia.weibo.service.PictureService;
import cn.bzerhia.weibo.service.UserService;
import cn.bzerhia.weibo.service.impl.BlogServiceImpl;
import cn.bzerhia.weibo.service.impl.PictureServiceImpl;
import cn.bzerhia.weibo.service.impl.UserServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.*;

@Controller
public class UploadController {
    private static List<String> pictures = new ArrayList();
    private String src = null;
    private String fengmian = null;




    private UserService userService = new UserServiceImpl();
    private PictureService pictureService = new PictureServiceImpl();
    private BlogService blogService = new BlogServiceImpl();


    @ResponseBody
    @RequestMapping({"picture"})
    public Map<String, Object> pictureUpload(@RequestParam("file") MultipartFile[] files, HttpServletRequest request, Model model) throws IOException {
        Map<String, Object> map = new HashMap<String, Object>();

        String basePath = Constant.HEADSHOT_SAVE_PATH;

        File folder = new File(basePath);

        if (files.length == 0) {
            map.put("code", Integer.valueOf(1));
            map.put("msg", "没有上传图片");
        }

        for (MultipartFile file : files) {

            try {
                String suffix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));

                String filename = UUID.randomUUID().toString() + suffix;

                File saveFile = new File(folder + "/" + filename);

                file.transferTo(saveFile);
                Picture data = new Picture();
                data.setSrc(Constant.HEADSHOT_PATH + filename);
                map.put("code", Integer.valueOf(0));
                map.put("msg", "");
                map.put("data", data);
            } catch (IOException e) {
                e.printStackTrace();
                map.put("code", Integer.valueOf(1));
                map.put("msg", "上传图片失败");
            }
        }
        return map;
    }
    @ResponseBody
    @RequestMapping({"upload"})
    public Map<String, Object> weiBoUpload(@RequestParam("file") MultipartFile[] files, HttpSession session) {
        Map<String, Object> map = new HashMap<String, Object>();

        String basePath = Constant.HEADSHOT_WEIBO;

        File folder = new File(basePath);
        if (files.length == 0) {
            map.put("code", Integer.valueOf(1));
            map.put("msg", "没有上传图片");
        }
        Picture picture = new Picture();
        for (MultipartFile file : files) {

            try {
                String suffix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));

                String filename = UUID.randomUUID().toString() + suffix;

                File saveFile = new File(folder + "/" + filename);

                file.transferTo(saveFile);
                picture.setSrc(Constant.HEADSHOT_PATH2 + filename);
                src = Constant.HEADSHOT_PATH2+ filename;
                map.put("code", Integer.valueOf(0));
                map.put("msg", "");
                map.put("data", picture);
            } catch (IOException e) {
                e.printStackTrace();
                map.put("code", Integer.valueOf(1));
                map.put("msg", "上传图片失败");
            }
        }
        pictures.add(this.src);
        session.setAttribute("picture", pictures);

        return map;
    }
    @ResponseBody
    @RequestMapping({"weiBo"})
    public Map<String, Object> weiBo(@RequestParam("file") MultipartFile[] files, HttpSession session, Integer userId, Integer blogId) {
        Map<String, Object> map = new HashMap<String, Object>();

        String basePath = Constant.HEADSHOT_WEIBO;

        File folder = new File(basePath);
        if (files.length == 0) {
            map.put("code", Integer.valueOf(1));
            map.put("msg", "没有上传图片");
        }
        Picture picture = new Picture();
        for (MultipartFile file : files) {

            try {
                String suffix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));

                String filename = UUID.randomUUID().toString() + suffix;

                File saveFile = new File(folder + "/" + filename);

                file.transferTo(saveFile);
                picture.setSrc(Constant.HEADSHOT_PATH2 + filename);
                this.src = Constant.HEADSHOT_PATH2 + filename;
                this.pictureService.updatePicture(this.src, userId, blogId);
                map.put("code", Integer.valueOf(0));
                map.put("msg", "");
                map.put("data", picture);
            } catch (IOException e) {
                e.printStackTrace();
                map.put("code", Integer.valueOf(1));
                map.put("msg", "上传图片失败");
            }
        }
        return map;
    }
    @ResponseBody
    @RequestMapping({"fengmian"})
    public Map<String, Object> blogUpload(@RequestParam("file") MultipartFile[] files, HttpSession session) {
        Map<String, Object> map = new HashMap<String, Object>();

        String basePath =Constant.HEADSHOT_FENGMIAN;

        File folder = new File(basePath);
        if (files.length == 0) {
            map.put("code", Integer.valueOf(1));
            map.put("msg", "没有上传图片");
        }
        Picture picture = new Picture();
        for (MultipartFile file : files) {

            try {
                String suffix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));

                String filename = UUID.randomUUID().toString() + suffix;

                File saveFile = new File(folder + "/" + filename);

                file.transferTo(saveFile);
                picture.setSrc(Constant.HEADSHOT_PATH3 + filename);
                this.fengmian = Constant.HEADSHOT_PATH3+ filename;
                map.put("code", Integer.valueOf(0));
                map.put("msg", "");
                map.put("data", picture);
            } catch (IOException e) {
                e.printStackTrace();
                map.put("code", Integer.valueOf(1));
                map.put("msg", "上传图片失败");
            }
        }
        session.setAttribute("fengmian", this.fengmian);
        return map;
    }

    @ResponseBody
    @RequestMapping({"blog"})
    public Map<String, Object> blog(@RequestParam("file") MultipartFile[] files, HttpSession session, Integer blogId) {
        Map<String, Object> map = new HashMap<String, Object>();

        String basePath = Constant.HEADSHOT_FENGMIAN;

        File folder = new File(basePath);
        if (files.length == 0) {
            map.put("code", Integer.valueOf(1));
            map.put("msg", "没有上传图片");
        }
        Picture picture = new Picture();
        for (MultipartFile file : files) {

            try {
                String suffix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));

                String filename = UUID.randomUUID().toString() + suffix;

                File saveFile = new File(folder + "/" + filename);

                file.transferTo(saveFile);
                picture.setSrc(Constant.HEADSHOT_PATH3 + filename);
                this.fengmian = Constant.HEADSHOT_PATH3+ filename;
                this.blogService.updateTitlePage("/images/fengmian/" + filename, blogId);
                map.put("code", Integer.valueOf(0));
                map.put("msg", "");
                map.put("data", picture);
            } catch (IOException e) {
                e.printStackTrace();
                map.put("code", Integer.valueOf(1));
                map.put("msg", "上传图片失败");
            }
        }
        return map;
    }
    @ResponseBody
    @RequestMapping({"touxiang"})
    public Map<String, Object> txBoUpload(@RequestParam("file") MultipartFile[] files, HttpSession session) {
        Map<String, Object> map = new HashMap<String, Object>();

        String basePath = Constant.HEADSHOT_TOUXIANG2;

        File folder = new File(basePath);
        if (files.length == 0) {
            map.put("code", Integer.valueOf(1));
            map.put("msg", "没有上传图片");
        }
        Picture picture = new Picture();
        for (MultipartFile file : files) {

            try {
                String suffix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));

                String filename = UUID.randomUUID().toString() + suffix;

                File saveFile = new File(folder + "/" + filename);

                file.transferTo(saveFile);
                picture.setSrc(Constant.HEADSHOT_PATH4 + filename);
                String src = Constant.HEADSHOT_PATH4 + filename;
                User user1 = (User)session.getAttribute("user");
                this.userService.updateTX(src, user1.getId());
                User user = userService.findByUsername(user1.getUsername());
                session.setAttribute("user", user);
                map.put("code", 0);
                map.put("msg", "");
                map.put("data", picture);
            } catch (IOException e) {
                e.printStackTrace();
                map.put("code", 1);
                map.put("msg", "上传图片失败");
            }
        }
        return map;
    }



    public static void remove() { pictures.clear(); }
}
