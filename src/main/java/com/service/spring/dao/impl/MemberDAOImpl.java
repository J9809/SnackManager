package com.service.spring.dao.impl;

import com.service.spring.dao.MemberDAO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.service.spring.domain.Member;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSession sqlSession;
	public static final String NS = "SnackMapper.";
	
	@Override
	public int registerMember(Member member) throws Exception {
		int result = sqlSession.insert(NS + "registerMember", member);
		return result;
	}

	@Override
	public int deleteMember(String memberId) throws Exception {
		int result = sqlSession.delete(NS + "deleteMember", memberId);
		return result;
	}

	@Override
	public Member login(Member member) throws Exception {
		Member result = sqlSession.selectOne(NS + "login", member);
		return result;
	}

	@Override
	public int updateMember(Member member) throws Exception {
		int result = sqlSession.update(NS + "updateMember", member);
		return result;
	}

}
