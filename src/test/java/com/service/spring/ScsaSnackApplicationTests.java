package com.service.spring;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import com.service.spring.domain.History;
import com.service.spring.domain.Member;

@SpringBootTest
class ScsaSnackApplicationTests {

	@Test
	public void unit() throws Exception{
		Reader r=Resources.getResourceAsReader("config/SqlMapConfig.xml");

        //1. SqlSessionFactory -- SqlSessionFactoryBean
        SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);

        //2. SqlSession -- SqlSessionTemplate
        SqlSession session=factory.openSession();
        
        Member pvo = new Member("muscleup15", "1234", "안광휘", "N", "student");
        List<History> list = session.selectList("SnackMapper.getHistory", pvo);
        for(History h : list) {
        	System.out.println(h);
        }
        
        //3. 쿼리문 실행

		
	}

}
