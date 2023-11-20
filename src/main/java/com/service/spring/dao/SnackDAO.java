package com.service.spring.dao;

import com.service.spring.domain.MemberRank;
import com.service.spring.domain.Snack;
import com.service.spring.domain.SnackRank;

import java.util.List;

public interface SnackDAO {

    List<Snack> selectAll() throws Exception;
    int fetchSnack(Snack snack) throws Exception;
    int registerSnack(Snack snack) throws Exception;
    int orderSnack(Snack snack) throws Exception;
    List<SnackRank> getSnackRank() throws Exception;

    List<MemberRank> getMemberRankBySnack(Snack snack) throws Exception;
}
