package com.deni.obs.controller;

import com.deni.obs.service.UserCmsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RestController
public class HomeController extends AbstractBaseController {

    @Autowired
    public HomeController(
                          UserCmsService userCmsService) {

        this.userCmsService = userCmsService;
    }
    @RequestMapping(value = {"/", "/home"}, method = RequestMethod.GET)
    public ModelAndView home(HttpServletRequest request, HttpSession session) {
        ModelAndView model = new ModelAndView();
        model.setViewName("home");

        return model;
    }
}
