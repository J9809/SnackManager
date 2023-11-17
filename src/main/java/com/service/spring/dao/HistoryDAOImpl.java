package com.service.spring.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.service.spring.domain.HistoryWithSnackName;
import com.service.spring.domain.Member;
import com.service.spring.domain.Snack;

@Repository
public class HistoryDAOImpl implements HistoryDAO{
	
	@Autowired
	private SqlSession sqlSession;
	public static final String NS = "SnackMapper.";

	@Override
	public List<HistoryWithSnackName> getHistory(Member member) throws Exception {
		List<HistoryWithSnackName> list = sqlSession.selectList(NS + "getHistory", member);
		return list;
	}

	@Override
	public int registerHistory(Snack snack) throws Exception {
		int result = sqlSession.insert(NS + "registerHistory", snack);
		return result;
	}

}
