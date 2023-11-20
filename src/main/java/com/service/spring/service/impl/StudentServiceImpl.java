package com.service.spring.service.impl;

import com.service.spring.dao.HistoryDAO;
import com.service.spring.dao.MemberDAO;
import com.service.spring.dao.SnackDAO;
import com.service.spring.dao.VoteDAO;
import com.service.spring.domain.*;
import com.service.spring.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentServiceImpl implements StudentService {

    @Autowired
    MemberDAO memberDAO;
    @Autowired
    SnackDAO snackDAO;
    @Autowired
    HistoryDAO historyDAO;
    @Autowired
    VoteDAO voteDAO;

    @Override
    public int registerMember(Member member) throws Exception {
        return memberDAO.registerMember(member);
    }

    @Override
    public int deleteMember(String memberId) throws Exception {
        return memberDAO.deleteMember(memberId);
    }

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
    public int fetchSnack(Snack snack) throws Exception {
        return snackDAO.fetchSnack(snack);
    }

    @Override
    public List<HistoryWithSnackName> getHistory(Member member) throws Exception {
        return historyDAO.getHistory(member);
    }

    @Override
    public int registerHistory(History history) throws Exception {
        return historyDAO.registerHistory(history);
    }

    @Override
    public int voteSnack(Vote vote) throws Exception {
        return voteDAO.voteSnack(vote);
    }

    @Override
    public int voteCheck(Member member) throws Exception {
        return voteDAO.checkVote(member);
    }
}
