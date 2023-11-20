package com.service.spring.dao;

import com.service.spring.domain.Member;
import com.service.spring.domain.MemberRank;

import java.util.List;

public interface MemberDAO {
	int registerMember(Member member) throws Exception;
	int deleteMember(String memberId) throws Exception;
	Member login(Member member) throws Exception;
	int updateMember(Member member) throws Exception;
	List<MemberRank> getMemberRank() throws Exception;
	Member checkDuplicateId(String memberId) throws Exception;
	
}
