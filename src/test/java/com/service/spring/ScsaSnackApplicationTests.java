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
import com.service.spring.domain.HistoryWithSnackName;
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
        SqlSession session=factory.openSession();

        //3. 쿼리문 실행
        System.out.println("\n======================전체 재고 조회======================\n");
        List<Snack> list=session.selectList("SnackMapper.selectAll");
        for(Snack vo:list)
            System.out.println(vo);


//        System.out.println("\n======================투표 결과 조회======================\n");
//        List<Object> list2=session.selectList("SnackMapper.viewVote");
//        for(Object ob:list2)
//            System.out.println(ob);
        
//        // Snack03
//        System.out.println("\n======================간식 선택 수량 변경======================\n");
//        Snack snack = new Snack(1000L, null, 0, null, 10, null);
//        int row=session.update("SnackMapper.fetchSnack", snack);
//        System.out.println(row+" 명이 수정 성공!!");
//        session.commit();
//    
//
//        // Snack04
//        System.out.println("\n======================간식 선택 기록 추가======================\n");
//        History history = new History(null, "cos", 1000L, 4, "1234");
//        row=session.insert("SnackMapper.registerHistory", history);
//        System.out.println(row+" 명이 수정 성공!!");
//        session.commit();
        
        // 간식 등록
//        Snack newsnack = new Snack("포켓몬빵", 99999, "", "과자", 1, "gogo", "fake_link");
//        int a = session.insert("SnackMapper.registerSnack", newsnack);
//        System.out.println(a+" 등록 성공!!");
//        session.commit();
        
//        System.out.println("\n======================사용자 랭킹 조회======================\n");
//        List<History> list3=ssession.selectList("SnackMapper.viewhistory");
//        for(History vo:list3)
//            System.out.println(vo);
//        System.out.println("\n============================================\n");
      
        
//        Member pvo = new Member("muscleup15", "1234", "안광휘", "N", "student");
//        List<History> list4 = session.selectList("SnackMapper.getHistory", pvo);
//        for(History h : list4) {
//        	System.out.println(h);
//        }
        
        //
        System.out.println("\n======================마이페이지 히스토리 조회======================\n");
        Member member = new Member("muscleup15", "1", "1", "Y", "student");
        List<HistoryWithSnackName> result = session.selectList("SnackMapper.getHistory", member);
        for (HistoryWithSnackName o: result) {
            System.out.println(o.getClass() + " " + o.toString());
        }
	}

}