package cn.bzerhia.weibo.controller;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;
import org.springframework.web.bind.annotation.PostMapping;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Random;

@Controller
public class EmailController
{
    private JavaMailSender javaMailSender;
    private Configuration configuration;

    public void init() {
        ClassPathXmlApplicationContext classPathXmlApplicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
        this.javaMailSender = (JavaMailSender)classPathXmlApplicationContext.getBean(org.springframework.mail.javamail.JavaMailSenderImpl.class);
        this.configuration = (Configuration)classPathXmlApplicationContext.getBean(Configuration.class);
    }


    @PostMapping({"sendMail"})
    public void sendMail(HttpSession session, String email, HttpServletResponse response) throws IOException {
        if (email == null || email.equals("")) {
            response.getWriter().write("err1");
            return;
        }
        if (!email.contains("@")) {
            response.getWriter().write("err2");
            return;
        }
        String validCode = getRandomString();
        session.setAttribute("validCode", validCode);
        init();
        sendMail4Freemarker(email, validCode);
        response.getWriter().write("ok");
    }


    public void sendMail4Freemarker(String email, String validCode) {
        MimeMessage mMessage = this.javaMailSender.createMimeMessage();

        Properties prop = new Properties();

        try {
            prop.load(getClass().getResourceAsStream("/email.properties"));
            String from = prop.get("mail.smtp.username") + "";
            MimeMessageHelper mMessageHelper = new MimeMessageHelper(mMessage, true, "UTF-8");

            mMessageHelper.setFrom(from);

            mMessageHelper.setTo(email);

            mMessageHelper.setSubject("邮箱验证");

            mMessageHelper.setText(getText(this.configuration, email, validCode), true);
            this.javaMailSender.send(mMessage);
        } catch (MessagingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    private String getText(Configuration freeMarkerConfiguration, String email, String validCode) {
        String txt = "";
        try {
            Template template = freeMarkerConfiguration.getTemplate("email.ftl");

            Map<String, Object> map = new HashMap<String, Object>();
            map.put("username", email);
            map.put("validCode", validCode);

            txt = FreeMarkerTemplateUtils.processTemplateIntoString(template, map);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (TemplateException e) {
            e.printStackTrace();
        }
        return txt;
    }

    public String getRandomString() {
        String str = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        Random random = new Random();
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < 4; i++) {
            int number = random.nextInt(62);
            sb.append(str.charAt(number));
        }
        return sb.toString();
    }
}
