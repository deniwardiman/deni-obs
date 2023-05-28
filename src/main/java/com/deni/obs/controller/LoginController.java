package com.deni.obs.controller;

import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;



@Controller
public class LoginController {

    @RequestMapping(value="/login", method=RequestMethod.GET)
    public String login(Principal principal) {
        return principal == null ?  "login" : "redirect:/home"; 
    }

}
