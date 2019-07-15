package cn.bzerhia.weibo.service.impl;

import cn.bzerhia.weibo.entity.Type;
import cn.bzerhia.weibo.mapper.TypeMapper;
import cn.bzerhia.weibo.service.TypeService;
import cn.bzerhia.weibo.util.MyBatisUtil;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TypeServiceImpl
        implements TypeService
{
    private MyBatisUtil myBatisUtil;
    private TypeMapper typeMapper;
    private SqlSession session;

    public void init() {
        this.session = MyBatisUtil.getSession();
        this.typeMapper = (TypeMapper)this.session.getMapper(TypeMapper.class);
    }
    public void close() {
        this.session.commit();
        this.session.close();
    }

    public List<Type> findAll() {
        init();
        List<Type> all = this.typeMapper.findAll();
        close();
        return all;
    }

    public List<Type> findAll2() {
        init();
        List<Type> all = this.typeMapper.findAll2();
        close();
        return all;
    }

    public int addType(Type type) {
        init();
        int i = this.typeMapper.addType(type);
        close();
        return i;
    }


    public int update(Type type) {
        init();
        int update = this.typeMapper.update(type);
        close();
        return update;
    }


    public int delete(Integer typeId) {
        init();
        int delete = this.typeMapper.delete(typeId);
        close();
        return delete;
    }
}
