package com.service.spring.service.impl;

import com.service.spring.dao.HistoryDAO;
import com.service.spring.dao.MemberDAO;
import com.service.spring.dao.SnackDAO;
import com.service.spring.dao.VoteDAO;
import com.service.spring.domain.MemberRank;
import com.service.spring.domain.Snack;
import com.service.spring.domain.SnackRank;
import com.service.spring.service.RankService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RankServiceImpl implements RankService {

    @Autowired
    MemberDAO memberDAO;
    @Autowired
    SnackDAO snackDAO;
    @Autowired
    HistoryDAO historyDAO;
    @Autowired
    VoteDAO voteDAO;
    @Override
    public List<MemberRank> getMemberRank() throws Exception {
        return memberDAO.getMemberRank();
    }

    @Override
    public List<SnackRank> getSnackRank() throws Exception {
        return snackDAO.getSnackRank();
    }

    @Override
    public List<MemberRank> getMemberRankBySnack(Snack snack) throws Exception {
        return snackDAO.getMemberRankBySnack(snack);
    }
}
