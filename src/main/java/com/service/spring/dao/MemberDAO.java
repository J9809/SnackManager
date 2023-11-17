package com.service.spring.dao;

import com.service.spring.domain.Member;

public interface MemberDAO {
	int registerMember(Member member) throws Exception;
	int deleteMember(String memberId) throws Exception;
	Member login(Member member) throws Exception;
	int updateMember(Member member) throws Exception;
	
}
