package com.deni.obs.security;

import com.deni.obs.model.UserCms;
import com.deni.obs.repository.UserCmsRepository;
import java.util.ArrayList;
import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
/* COMMENT */
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
/* COMMENT */
import org.springframework.stereotype.Service;

import java.util.List;

@Service("customAccountDetailsService")
public class CustomAccountDetailsService /* COMMENT */ implements UserDetailsService /* COMMENT */{

    private final UserCmsRepository userCmsRepository;

    @Autowired
    public CustomAccountDetailsService(UserCmsRepository userCmsRepository) {
        this.userCmsRepository = userCmsRepository;
    }

    /* COMMENT */
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        UserCms email = userCmsRepository.findByEmail(username);

        if (null == email) {
            throw new UsernameNotFoundException("No account present with email: "+username);
        } else {
            if (email.isIsLocked()) {
                Calendar cal = Calendar.getInstance();
                cal.add(Calendar.MINUTE, -10);
                if(email.getLastLogin().after(cal.getTime())){
                    throw new RuntimeException("blocked");
                }
            }

            List<String> userRoles = new ArrayList<>();
            return new CustomAccountDetails(email,userRoles);
        }
    }
    /* COMMENT */
		
}
