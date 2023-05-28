package com.deni.obs.repository;

import com.deni.obs.model.UserCms;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface UserCmsRepository extends JpaRepository<UserCms, String> {

    @Query("select a from UserCms a where a.isDeleted = false and  a.email=?1 and a.isActive=true")
    UserCms findByEmail(String email);
}
