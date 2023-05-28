package com.deni.obs.service;

import com.deni.obs.repository.UserCmsRepository;

import java.util.*;

import com.deni.obs.model.UserCms;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserCmsService {
    private final UserCmsRepository userCmsRepository;

    @Autowired
    public UserCmsService(UserCmsRepository userCmsRepository) {
        this.userCmsRepository = userCmsRepository;
    }

    public void loginFailed(String email){
        UserCms user = userCmsRepository.findByEmail(email);
        if(user != null){
            Calendar cal = Calendar.getInstance();
            cal.add(Calendar.MINUTE, -10);
            if(user.getLastLogin() == null || user.getLastLogin().before(cal.getTime())){
                user.setLastAttempt(1);
            }else{
                if(user.getLastAttempt() > 3){
                    user.setLastAttempt(0);
                    user.setIsLocked(true);
                }else user.setLastAttempt(user.getLastAttempt()+1);
            }
            user.setLastLogin(new Date());
            userCmsRepository.saveAndFlush(user);
        }
    }
    
    public void loginSucced(String email) {
        UserCms user = userCmsRepository.findByEmail(email);
        if (user != null) {
            user.setIsLocked(false);
            user.setLastAttempt(0);
            user.setLastLogin(new Date());
            userCmsRepository.saveAndFlush(user);
        }
    }

    public UserCms findByEmail(String email) {
        return userCmsRepository.findByEmail(email);
    }

    public void update(UserCms userCms) {
        userCmsRepository.saveAndFlush(userCms);
    }
}