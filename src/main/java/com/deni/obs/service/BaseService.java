package com.deni.obs.service;

import com.deni.obs.model.BaseModel;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by nunu
 */
@Transactional(readOnly = true)
public abstract class BaseService<T extends BaseModel> extends AbstractBaseService<T>{
    
    @Transactional
    @Override
    public T add(T t) {
        T updated = getJpaRepository().save(t);

        if (null != updated.getId()) {
            return t;
        }
        return null;
    }
    
    @Transactional
    @Override
    public T update(T t) {
        getJpaRepository().saveAndFlush(t);
        return t;
    }
    
    @Override
    @Transactional
    public Boolean delete(String id) {
        T t = getJpaRepository().getOne(id);

        if (null != t) {
            t.setIsDeleted(true);
            getJpaRepository().saveAndFlush(t);
            return Boolean.TRUE;
        }
        return Boolean.FALSE;
    }
    
    @Override
    public T findById(String id) {

        T t = getJpaRepository().getOne(id);
        
        return t;
    }
}
