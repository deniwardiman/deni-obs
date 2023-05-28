/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.deni.obs.controller;

import com.deni.obs.config.ConstantConfig;
import com.deni.obs.model.UserCms;
import com.deni.obs.security.CustomAccountDetails;
import com.deni.obs.security.FileUploadValidator;
import com.deni.obs.service.UserCmsService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

/**
 * @author nunu
 */
public abstract class AbstractBaseController {
    private static final Logger logger = LoggerFactory.getLogger(AbstractBaseController.class);

    protected final static String INSERT_FAILED = "Insert data failed";
    protected final static String INSERT_SUCCESS = "Insert data succeed";
    protected final static String UPDATE_FAILED = "Update data failed";
    protected final static String UPDATE_SUCCESS = "Update data succeed";
    protected final static String DELETE_SUCCESS = "Delete data succeed";
    protected final static String DELETE_FAILED = "Delete data failed";
    protected final static String RETRIEVE_SUCCESS = "Retrieve data succeed";
    protected final static String RETRIEVE_FAILED = "Retrieve data failed";
    protected final static String MODE_ADD = "ADD";
    protected final static String MODE_EDIT = "EDIT";

    public FileUploadValidator validator;
    public UserCmsService userCmsService;

    public static String getLoggedUserId() {
        if (ConstantConfig.getInstance().isBypassLogin()) {
            return "ab203982-13d0-427e-bc4b-8d887712b7c0";
        } else {
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            CustomAccountDetails principal = (CustomAccountDetails) authentication.getPrincipal();
            return principal.getId();
        }

    }

    public static UserCms getLoggedUser() {
        if (ConstantConfig.getInstance().isBypassLogin()) {
            return null;
        } else {
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            return (CustomAccountDetails) authentication.getPrincipal();
        }
    }

    @Autowired
    public void setDependency(FileUploadValidator validator, UserCmsService userCmsService) {
        this.validator = validator;
        this.userCmsService = userCmsService;
    }
}
