package com.service.spring;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import com.service.spring.domain.Member;

@SpringBootTest
class ScsaSnackApplicationTests {
	
	
    @Test
    void contextLoads() throws Exception{
        Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
        SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
      
       SqlSession session=factory.openSession();
       Member pvo = new Member("qweck", "1234", "양희재", "N", "student");
       int a = session.insert("SnackMapper.registerMember", pvo);
       session.commit();
       System.out.println(a);
    }

}