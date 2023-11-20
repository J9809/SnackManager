package com.service.spring.service;

import com.service.spring.domain.MemberRank;
import com.service.spring.domain.Snack;
import com.service.spring.domain.SnackRank;

import java.util.List;

public interface RankService {
    List<MemberRank> getMemberRank() throws Exception;

    List<SnackRank> getSnackRank() throws Exception;

    List<MemberRank> getMemberRankBySnack(Snack snack) throws Exception;
}
