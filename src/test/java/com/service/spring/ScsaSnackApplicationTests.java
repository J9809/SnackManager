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
import com.service.spring.domain.Snack;
import com.service.spring.domain.Vote;
import com.service.spring.domain.Member;

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
        System.out.println("\n======================전체 재고 조회======================\n");
        List<Snack> list=ssession.selectList("SnackMapper.selectAll");
        for(Snack vo:list)
            System.out.println(vo);
        System.out.println("\n============================================\n");


        System.out.println("\n======================투표 결과 조회======================\n");
        List<Vote> list2=ssession.selectList("SnackMapper.viewVote");
        for(Vote vo:list2)
            System.out.println(vo);
        System.out.println("\n============================================\n");
        
        System.out.println("\n======================사용자 랭킹 조회======================\n");
        List<History> list3=ssession.selectList("SnackMapper.viewhistory");
        for(History vo:list3)
            System.out.println(vo);
        System.out.println("\n============================================\n");
      
        
//        Member pvo = new Member("muscleup15", "1234", "안광휘", "N", "student");
//        List<History> list4 = session.selectList("SnackMapper.getHistory", pvo);
//        for(History h : list4) {
//        	System.out.println(h);
//        }
        
        //3. 쿼리문 실행

		
	}

}