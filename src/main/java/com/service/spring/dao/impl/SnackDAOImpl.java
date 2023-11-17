package com.service.spring.dao.impl;

import com.service.spring.dao.SnackDAO;
import com.service.spring.domain.Snack;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class SnackDAOImpl implements SnackDAO {

    @Autowired
    private SqlSession sqlSession;
    public static final String NS = "SnackMapper.";

    @Override
    public List<Snack> selectAll() throws Exception {
        return sqlSession.selectList(NS + "selectAll");
    }

    @Override
    public int fetchSnack(Snack snack) throws Exception {
        return sqlSession.update(NS + "fetchSnack", snack);
    }

    @Override
    public int registerSnack(Snack snack) throws Exception {
        return sqlSession.insert(NS + "registerSnack", snack);
    }

    @Override
    public int orderSnack(Snack snack) throws Exception {
        return sqlSession.update(NS + "orederSnack", snack);
    }
}
