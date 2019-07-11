package cn.bzerhia.weibo.service.impl;

import cn.bzerhia.weibo.entity.Type;
import cn.bzerhia.weibo.mapper.TypeMapper;
import cn.bzerhia.weibo.mapper.UserMapper;
import cn.bzerhia.weibo.service.TypeService;
import cn.bzerhia.weibo.util.MyBatisUtil;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TypeServiceImpl implements TypeService {


    private MyBatisUtil myBatisUtil;
    private TypeMapper typeMapper;
    private SqlSession session;
    public void init(){
        session = MyBatisUtil.getSession();
        typeMapper = session.getMapper(TypeMapper.class);
    }
    public void close(){
        session.commit();
        session.close();
    }
    @Override
    public List<Type> findAll() {
        init();
        List<Type> all = typeMapper.findAll();
        close();
        return all;
    }
    @Override
    public List<Type> findAll2() {
        init();
        List<Type> all = typeMapper.findAll2();
        close();
        return all;
    }
    @Override
    public int addType(Type type) {
        init();
        int i = typeMapper.addType(type);
        close();
        return i;
    }

    @Override
    public int update(Type type) {
        init();
        int update = typeMapper.update(type);
        close();
        return update;
    }

    @Override
    public int delete(Integer typeId) {
        init();
        int delete = typeMapper.delete(typeId);
        close();
        return delete;
    }
}
