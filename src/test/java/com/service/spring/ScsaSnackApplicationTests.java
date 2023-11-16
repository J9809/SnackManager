package com.service.spring;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import com.service.spring.domain.MemberVO;

@SpringBootTest
class ScsaSnackApplicationTests {

    @Test
    void contextLoads() throws IOException {
    	Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
    	SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
	  
		  //2. SqlSession -- SqlSessionTemplate
	   SqlSession session=factory.openSession();
	   MemberVO pvo = new MemberVO("muscleup15", "안광휘", "1234", "N", "student");
	   MemberVO rvo = session.selectOne("SnackMapper.login", pvo);
	   System.out.println(rvo);
    }

}
