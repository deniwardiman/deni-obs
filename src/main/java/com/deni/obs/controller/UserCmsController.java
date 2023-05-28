package com.deni.obs.controller;

import com.deni.obs.model.BaseResponse;
import com.deni.obs.model.UserCms;
import com.deni.obs.security.CustomAccountDetails;
import com.deni.obs.service.UserCmsService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RestController
@MultipartConfig
@RequestMapping("/usercms")
public class UserCmsController extends AbstractBaseController {

    private final UserCmsService userCmsService;
    private final PasswordEncoder passwordEncoder;

    @Autowired
    public UserCmsController(UserCmsService userCmsService, PasswordEncoder passwordEncoder) {
        this.userCmsService = userCmsService;
        this.passwordEncoder = passwordEncoder;
    }

    @SuppressWarnings("rawtypes")
    @RequestMapping(value = "/change_password", method = RequestMethod.POST)
    public BaseResponse changePassword(HttpServletRequest request) {
        String message = "Data success updated, please relogin again";

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        CustomAccountDetails principal = (CustomAccountDetails) authentication.getPrincipal();

        UserCms user = userCmsService.findByEmail(principal.getEmail());
        user.setPassword(passwordEncoder.encode(request.getParameter("new_password")));
        userCmsService.update(user);

        BaseResponse response = new BaseResponse();
        response.setBaseResponse(1, 0, 1, message, null);
        return response;
    }

    @RequestMapping(value = "/get_password", method = RequestMethod.POST)
    @ResponseBody
    public String getPassword(@RequestParam("password") String password) throws JsonProcessingException {

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        LinkedHashMap<String, Object> responseBody = new LinkedHashMap<>();
        ObjectMapper objectMapper = new ObjectMapper();

        String res;

        if (authentication!=null) {

            CustomAccountDetails principal = (CustomAccountDetails) authentication.getPrincipal();

            Boolean passwordMatch = passwordEncoder.matches(password, principal.getPassword());

            responseBody.put("success", passwordMatch);
            responseBody.put("msg", passwordMatch ? "Password match" : "Password did not match");

            res = objectMapper.writeValueAsString(responseBody);
        } else {
            responseBody.put("success", Boolean.FALSE);
            responseBody.put("msg", "Please Re-login!");

            res = objectMapper.writeValueAsString(responseBody);
        }

        return res;
    }

    @RequestMapping(value = "/update_profile", method = RequestMethod.POST)
    public BaseResponse updateProfile(
            HttpServletRequest request
    ) throws Exception  {

        BaseResponse response = new BaseResponse();

        try {
            String message = "Data success updated, please relogin again";

            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            CustomAccountDetails principal = (CustomAccountDetails) authentication.getPrincipal();

            UserCms user = userCmsService.findByEmail(principal.getEmail());
            user.setName(request.getParameter("name"));
            userCmsService.update(user);

            response.setBaseResponse(1, 0, 1, message, null);

        } catch(Exception e){
            response.setBaseResponse(0, 0, 1, e.getMessage(), null);
        }
        return response;
    }
}
