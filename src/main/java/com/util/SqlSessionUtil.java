package com.util;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.io.InputStream;

@Component
public class SqlSessionUtil {

    //声明一个SqlSessionFactory ,最好一份，并且单例
    private static SqlSessionFactory sqlSessionFactory = null;

    //获取SqlSession
    public SqlSession getSqlSession() {
        if (sqlSessionFactory == null) {
            /**
             * 获取配置文件的输入流
             */
            try {
                InputStream inputStream = Resources.getResourceAsStream("mybatis-config.xml");
                sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
        return sqlSessionFactory.openSession();
    }

/*
    public static void main(String[] args) {
        SqlSession sqlSession = SqlSessionUtil.;
        StaffDao_ acc = sqlSession.getMapper(StaffDao_.class);
        sqlSession.commit();
        sqlSession.close();

        System.out.println(sqlSession.getConnection().toString());
    }
*/
}
