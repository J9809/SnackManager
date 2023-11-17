package com.service.spring.service;

import com.service.spring.domain.Member;
import com.service.spring.domain.Snack;
import com.service.spring.domain.VoteWithSnackInfo;

import java.util.List;

public interface AdminService {
    Member login(Member member) throws Exception;
    int updateMember(Member member) throws Exception;
    List<Snack> selectAll() throws Exception;
    int registerSnack(Snack snack) throws Exception;
    int orderSnack(Snack snack) throws Exception;
    List<VoteWithSnackInfo> viewVote() throws Exception;

}
