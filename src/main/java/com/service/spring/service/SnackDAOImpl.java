package com.service.spring.service;

import com.service.spring.dao.SnackDAO;
import com.service.spring.domain.Snack;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class SnackDAOImpl implements SnackDAO {

    @Override
    public List<Snack> selectAll() throws Exception {
        return null;
    }

    @Override
    public int fetchSnack(Snack snack) throws Exception {
        return 0;
    }

    @Override
    public int registerSnack(Snack snack) throws Exception {
        return 0;
    }

    @Override
    public int orderSnack(Snack snack) throws Exception {
        return 0;
    }
}
