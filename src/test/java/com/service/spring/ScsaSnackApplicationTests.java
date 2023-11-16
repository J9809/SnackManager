package com.service.spring;

<<<<<<< HEAD
import java.io.IOException;
import java.io.Reader;
=======
import java.io.Reader;
import java.util.List;
>>>>>>> a8a9229d0db6f3cda164b45f0d639133a1729911

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

<<<<<<< HEAD
import com.service.spring.domain.Member;
=======
import com.service.spring.domain.Snack;
>>>>>>> a8a9229d0db6f3cda164b45f0d639133a1729911

@SpringBootTest
class ScsaSnackApplicationTests {

<<<<<<< HEAD
    @Test
    void contextLoads() throws IOException {
    	Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
    	SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
	  
		  //2. SqlSession -- SqlSessionTemplate
	   SqlSession session=factory.openSession();
	   Member pvo = new Member("muscleup15", "5678", "안광휘", "N", "student");
//	   Member rvo = session.selectOne("SnackMapper.login", pvo);
//	   System.out.println(rvo);
	   
	   //update test
	   int a = session.update("SnackMapper.updateMember", pvo);
	   session.commit();
	   System.out.println(a);
	   
	   
    }
=======
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
>>>>>>> a8a9229d0db6f3cda164b45f0d639133a1729911

}
