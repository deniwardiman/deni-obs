/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.deni.obs.security;

import com.deni.obs.service.UserCmsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.security.authentication.event.AuthenticationSuccessEvent;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.stereotype.Component;

@Component
public class AuthenticationSuccessEventListener 
  implements ApplicationListener<AuthenticationSuccessEvent> {
 
    @Autowired
    private final UserCmsService userCmsService;

    public AuthenticationSuccessEventListener(UserCmsService userCmsService) {
        this.userCmsService = userCmsService;
    }
 
    public void onApplicationEvent(AuthenticationSuccessEvent e) {
        WebAuthenticationDetails auth = (WebAuthenticationDetails) e.getAuthentication().getDetails();
        
        CustomAccountDetails principal = (CustomAccountDetails) e.getAuthentication().getPrincipal();
        userCmsService.loginSucced(principal.getEmail());
    }
}
