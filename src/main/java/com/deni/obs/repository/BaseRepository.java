package com.deni.obs.repository;

import com.deni.obs.model.BaseModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.NoRepositoryBean;


@NoRepositoryBean
public interface BaseRepository<T extends BaseModel> extends JpaRepository<T, String>, JpaSpecificationExecutor<T> {

 //   T findById(String id);

 //   boolean exists(String id);
}
