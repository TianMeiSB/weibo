package cn.bzerhia.weibo.util;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;

import java.io.IOException;
import java.io.InputStream;

/**
 * MyBatis的session获取工具类
 */
//@Component
public class MyBatisUtil {
	
	private static SqlSessionFactory factory = null;//定义一个静态的session工厂

	//初始化session工厂方法
	private static void initialFactory() {
		String resource = "mybatis-config.xml";
		try {
			InputStream in = Resources.getResourceAsStream(resource);//把配置文件读取到输入流中
			factory = new SqlSessionFactoryBuilder().build(in);//通过SqlSessionFactoryBuilder构建session工厂对象
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	//获取session的静态方法
	public static SqlSession getSession() {
		if (factory == null) {
			initialFactory();
		}
		return factory.openSession();//获取session
	}
	
	public static void main(String[] args) {
		System.out.println(getSession());
	}
}
