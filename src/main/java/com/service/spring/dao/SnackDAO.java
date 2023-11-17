package com.service.spring.dao;

import com.service.spring.domain.Snack;

import java.util.List;

public interface SnackDAO {

    List<Snack> selectAll() throws Exception;
    int fetchSnack(Snack snack) throws Exception;
    int registerSnack(Snack snack) throws Exception;
    int orderSnack(Snack snack) throws Exception;
}
