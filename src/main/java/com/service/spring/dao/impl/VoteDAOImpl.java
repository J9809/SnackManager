package com.service.spring.dao.impl;

import java.util.List;

import com.service.spring.dao.VoteDAO;
import com.service.spring.domain.Member;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.service.spring.domain.Vote;
import com.service.spring.domain.VoteWithSnackInfo;

@Repository
public class VoteDAOImpl implements VoteDAO {
	
	@Autowired
	private SqlSession sqlSession;
	public static final String NS = "SnackMapper.";

	@Override
	public List<VoteWithSnackInfo> viewVote() throws Exception {
		
		List<VoteWithSnackInfo> list = sqlSession.selectList(NS + "viewVote");
		return list;
	}

	@Override
	public int voteSnack(Vote vote) throws Exception {
		int result = sqlSession.insert(NS + "voteSnack", vote);
		return result;
	}

	@Override
	public int checkVote(Member member) throws Exception {
		return sqlSession.selectOne(NS + "checkVote", member);
	}

	@Override
	public int deleteVote() throws Exception {
		return sqlSession.delete(NS + "deleteVote");
	}

}
