package com.service.spring;

import java.io.IOException;
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
    void contextLoads() throws IOException {
    	Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
    	SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
	  
		  //2. SqlSession -- SqlSessionTemplate
	   SqlSession session=factory.openSession();
	   Member pvo = new Member("muscleup15", "1234", "안광휘", "N", "student");
	   Member rvo = session.selectOne("SnackMapper.login", pvo);
	   System.out.println(rvo);
    }

}
