package com.nrg.service.impl;

import com.nrg.base.BaseDao;
import com.nrg.service.IBaseService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 善于游勇 on 2017/7/15.
 */

@Service
@Transactional(rollbackFor = Exception.class)
public abstract class BaseServiceImpl<T> implements IBaseService<T> {

    private Logger log = Logger.getLogger(BaseServiceImpl.class);
    @Autowired
    private BaseDao<T> dao;


    @Override
    public T get(Long id) {
        return dao.get(id);
    }

    @Override
    public T get(T entity) {
        return dao.getByEntity(entity);
    }

    @Override
    public List findList(T entity) {
        return dao.findList(entity);
    }

    @Override
    public List findAllList(T entity) {
        return dao.findAllList(entity);
    }

    @Override
    public List findAllList() {
        return dao.findAllList();
    }

    @Override
    public int save(T entity) {
        return dao.insert(entity);
    }
    
    @Override
    public int insertSelective(T entity) {
        return dao.insertSelective(entity);
    }

    @Override
    public int update(T entity) {
        return dao.update(entity);
    }

    @Override
    public int updateByCondition(T entity) {
        return dao.updateByCondition(entity);
    }

    @Override
    public int delete(T entity) {
        return  dao.deleteByEntity(entity);
    }

    @Override
    public int deleteById(Long id) {
        return dao.delete(id);
    }

    @Override
    public int remove(Long id) {
        return dao.remove(id);
    }

    @Override
    public int removeByEntity(T entity) {
        return dao.removeByEntity(entity);
    }

    @Override
    public int deleteByEntity(T entity) {
        return dao.deleteByEntity(entity);
    }

    @Override
    public void batchRemove(List ids) {
        dao.batchRemove(ids);
    }

    @Override
    public void batchDelete(List ids) {
        dao.batchDelete(ids);
    }
}
