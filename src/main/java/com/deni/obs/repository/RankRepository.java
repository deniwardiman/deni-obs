package com.deni.obs.repository;

import com.deni.obs.model.Ranks;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;


@Repository
public interface RankRepository extends BaseRepository<Ranks> {

    
    @Query("SELECT u from Ranks u where u.isDeleted = false and u.department like %:name%")
    public Page<Ranks> findAll(Pageable pageable, @Param("name") String keyword);

    @Query("SELECT COUNT(u) FROM Ranks u where u.isDeleted = false ")
    Long findTotalRow();
}
