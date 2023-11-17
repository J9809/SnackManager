package com.service.spring.dao;

import com.service.spring.domain.HistoryWithSnackName;
import com.service.spring.domain.Member;
import com.service.spring.domain.Snack;

import java.util.List;

public interface HistoryDAO {
    List<HistoryWithSnackName> getHistory(Member member) throws Exception;
    int registerHistory(Snack snack) throws Exception;
}
