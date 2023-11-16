package com.service.spring;

import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import com.service.spring.domain.Snack;

@SpringBootTest
class ScsaSnackApplicationTests {

	@Test
	public void unit() throws Exception{
		Reader r=Resources.getResourceAsReader("config/SqlMapConfig.xml");

        //1. SqlSessionFactory -- SqlSessionFactoryBean
        SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);

        //2. SqlSession -- SqlSessionTemplate
        SqlSession ssession=factory.openSession();

        //3. 쿼리문 실행
        List<Snack> list=ssession.selectList("SnackMapper.selectAll");
        for(Snack vo:list)
            System.out.println(vo);

        System.out.println("\n============================================\n");
        
		
	}

}