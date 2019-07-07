package cn.bzerhia.weibo.controller;

import cn.bzerhia.weibo.constant.Constant;
import cn.bzerhia.weibo.entity.Picture;
import cn.bzerhia.weibo.entity.User;
import cn.bzerhia.weibo.service.UserService;
import cn.bzerhia.weibo.service.impl.UserServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
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
    private  static List<String> pictures = new ArrayList<String>();
    private String src = null;
    private String fengmian = null;
    private UserService userService;
    public UploadController() {
        userService = new UserServiceImpl();
    }
    @ResponseBody
    @RequestMapping(value="picture")
    public Map<String, Object> pictureUpload(@RequestParam("file") MultipartFile[] files, HttpServletRequest request, Model model)
            throws IOException {
        Map<String, Object> map = new HashMap<String, Object>();
        // 获取文件存放路径
        String basePath = Constant.HEADSHOT_SAVE_PATH;
        // 判断文件夹是否存在，不存在则
        File folder = new File(basePath);

        if(files.length==0){
            map.put("code",1);
            map.put("msg","没有上传图片！");
        }

        for(MultipartFile file : files) {
            try {
                //获取文件的后缀名
                String suffix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));;
                //新文件名
                String filename = UUID.randomUUID().toString() + suffix;
                //新文件对象
                File saveFile = new File(folder + "/" + filename);
                //保存文件
                file.transferTo(saveFile);
                Picture data = new Picture();
                data.setSrc(Constant.HEADSHOT_PATH+filename);
                map.put("code",0);
                map.put("msg","");
                map.put("data",data);
            } catch (IOException e) {
                e.printStackTrace();
                map.put("code",1);
                map.put("msg","上传图片失败！");
            }
        }
        return map;
    }
    @ResponseBody
    @RequestMapping(value="upload")
    public Map<String,Object> weiBoUpload(@RequestParam("file") MultipartFile[] files, HttpSession session){
        Map<String,Object> map = new HashMap<String,Object>();
        // 获取文件存放路径
        String basePath = Constant.HEADSHOT_WEIBO;
        // 判断文件夹是否存在，不存在则
        File folder = new File(basePath);
        if(files.length==0){
            map.put("code",1);
            map.put("msg","没有上传图片！");
        }
        Picture picture = new Picture();
        for(MultipartFile file : files) {
            try {
                //获取文件的后缀名
                String suffix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));;
                //新文件名
                String filename = UUID.randomUUID().toString() + suffix;
                //新文件对象
                File saveFile = new File(folder + "/" + filename);
                //保存文件
                file.transferTo(saveFile);
                picture.setSrc(Constant.HEADSHOT_PATH2+filename);
                src = Constant.HEADSHOT_PATH2+filename;
                map.put("code",0);
                map.put("msg","");
                map.put("data",picture);
            } catch (IOException e) {
                e.printStackTrace();
                map.put("code",1);
                map.put("msg","上传图片失败！");
            }
        }
        pictures.add(src);
        session.setAttribute("picture",pictures);
        for(String s:pictures){
            System.out.println(s);
        }
        return map;
    }

    @ResponseBody
    @RequestMapping(value="fengmian")
    public Map<String,Object> blogUpload(@RequestParam("file") MultipartFile[] files, HttpSession session){
        Map<String,Object> map = new HashMap<String,Object>();
        // 获取文件存放路径
        String basePath = Constant.HEADSHOT_FENGMIAN;
        // 判断文件夹是否存在，不存在则
        File folder = new File(basePath);
        if(files.length==0){
            map.put("code",1);
            map.put("msg","没有上传图片！");
        }
        Picture picture = new Picture();
        for(MultipartFile file : files) {
            try {
                //获取文件的后缀名
                String suffix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));;
                //新文件名
                String filename = UUID.randomUUID().toString() + suffix;
                //新文件对象
                File saveFile = new File(folder + "/" + filename);
                //保存文件
                file.transferTo(saveFile);
                picture.setSrc(Constant.HEADSHOT_PATH3+filename);
                fengmian = Constant.HEADSHOT_PATH3+filename;
                map.put("code",0);
                map.put("msg","");
                map.put("data",picture);
            } catch (IOException e) {
                e.printStackTrace();
                map.put("code",1);
                map.put("msg","上传图片失败！");
            }
        }
        session.setAttribute("fengmian",fengmian);
        return map;
    }
    @ResponseBody
    @RequestMapping(value="touxiang")
    public Map<String,Object> txBoUpload(@RequestParam("file") MultipartFile[] files, HttpSession session){
        Map<String,Object> map = new HashMap<String,Object>();
        // 获取文件存放路径
        String basePath = Constant.HEADSHOT_TOUXIANG2;
        // 判断文件夹是否存在，不存在则
        File folder = new File(basePath);
        if(files.length==0){
            map.put("code",1);
            map.put("msg","没有上传图片！");
        }
        Picture picture = new Picture();
        for(MultipartFile file : files) {
            try {
                //获取文件的后缀名
                String suffix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));;
                //新文件名
                String filename = UUID.randomUUID().toString() + suffix;
                //新文件对象
                File saveFile = new File(folder + "/" + filename);
                //保存文件
                file.transferTo(saveFile);
                picture.setSrc(Constant.HEADSHOT_PATH4+filename);
               String src = Constant.HEADSHOT_PATH4+filename;
                User user1 = (User)session.getAttribute("user");
                userService.updateTX(src,user1.getId());
                User user = userService.findByUsername(user1.getUsername());
                session.setAttribute("user",user);
                map.put("code",0);
                map.put("msg","");
                map.put("data",picture);
            } catch (IOException e) {
                e.printStackTrace();
                map.put("code",1);
                map.put("msg","上传图片失败！");
            }
        }
        return map;
    }


    public static  void remove(){
        pictures.clear();
    }
}
