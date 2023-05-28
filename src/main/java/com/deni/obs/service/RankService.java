package com.deni.obs.service;

import com.deni.obs.model.Ranks;
import com.deni.obs.repository.BaseRepository;
import com.deni.obs.repository.RankRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional
public class RankService extends BaseService<Ranks>{

    private final RankRepository rankRepository;



    @Autowired
    public RankService(RankRepository rankRepository) {
            this.rankRepository = rankRepository;
    }
    
    @Override
    protected BaseRepository<Ranks> getJpaRepository() {
        return rankRepository;
    }

    public Page<Ranks> findAll(Pageable pageable, String keyword) {
        return rankRepository.findAll(pageable, keyword);
    }

    public Long findTotalRow() {
        return rankRepository.findTotalRow();
    }
}
