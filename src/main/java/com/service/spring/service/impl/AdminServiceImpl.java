package com.service.spring.service.impl;

import com.service.spring.dao.MemberDAO;
import com.service.spring.dao.SnackDAO;
import com.service.spring.dao.VoteDAO;
import com.service.spring.domain.Member;
import com.service.spring.domain.Snack;
import com.service.spring.domain.VoteWithSnackInfo;
import com.service.spring.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private MemberDAO memberDAO;
    @Autowired
    private SnackDAO snackDAO;
    @Autowired
    private VoteDAO voteDAO;

    @Override
    public Member login(Member member) throws Exception {
        return memberDAO.login(member);
    }

    @Override
    public int updateMember(Member member) throws Exception {
        return memberDAO.updateMember(member);
    }

    @Override
    public List<Snack> selectAll() throws Exception {
        return snackDAO.selectAll();
    }

    @Override
    public int registerSnack(Snack snack) throws Exception {
        return snackDAO.registerSnack(snack);
    }

    @Override
    public int orderSnack(Snack snack) throws Exception {
        return snackDAO.orderSnack(snack);
    }

    @Override
    public List<VoteWithSnackInfo> viewVote() throws Exception {
        return voteDAO.viewVote();
    }
}
