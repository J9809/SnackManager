package com.service.spring.dao;

import com.service.spring.domain.Vote;
import com.service.spring.domain.VoteWithSnackInfo;

import java.util.List;

public interface VoteDAO {
    List<VoteWithSnackInfo> viewVote() throws Exception;
    int voteSnack(Vote vote) throws Exception;
}
