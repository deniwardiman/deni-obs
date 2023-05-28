package com.deni.obs.service;

import com.deni.obs.model.BaseModel;
import com.deni.obs.repository.BaseRepository;
import org.apache.commons.lang3.StringUtils;
import org.springframework.data.domain.Sort;

/**
 * Created by yukibuwana on 1/24/17.
 */
public abstract class AbstractBaseService<T extends BaseModel> {

    protected abstract BaseRepository<T> getJpaRepository();

    public abstract T add(T t);

    public abstract T update(T t);

    public abstract Boolean delete(String id);

    public abstract T findById(String id);

    public static Sort getSortBy(String sortBy, String direction) {
        if (StringUtils.equalsIgnoreCase(direction, "asc")) {
            return Sort.by(Sort.Direction.ASC, sortBy);
        } else {
            return Sort.by(Sort.Direction.DESC, sortBy);
        }
    }
}
