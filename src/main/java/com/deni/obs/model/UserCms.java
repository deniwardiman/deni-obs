package com.deni.obs.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;

import javax.persistence.*;
import java.util.*;

import org.codehaus.jackson.map.Serializers;
import org.hibernate.annotations.ColumnDefault;

@Entity
@Table(name = "users_cms")
public class UserCms extends BaseModel {
    private static final long serialVersionUID = 4480994239348052016L;

    @JsonIgnore
    @Column(length = 500)
    private String password;

    @Column(length = 50)
    private String email;
    
    @Column(length = 100)
    private String name;
    @JsonProperty("is_active")
    @Column(name = "is_active")
    private boolean isActive;

    @Column(name = "salt")
    private String salt;

    @Column(name = "is_locked")
    @ColumnDefault("0")
    @JsonIgnore
    public boolean isLocked = false;

    @Column(name = "last_attempt")
    @ColumnDefault("0")
    @JsonIgnore
    public int lastAttempt;

    @Column(name = "last_login")
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'", timezone = "UTC")
    @JsonIgnore
    public Date lastLogin;
    
    public UserCms() {
        this.id = UUID.randomUUID().toString();
    }
    
    public UserCms(String password, String name, String email, Boolean isActive, String profilePhoto) {
        this.password = password;
        this.name = name;
        this.email = email;
        this.isActive = isActive;
        this.isDeleted = false;
        this.createdAt = new Date();
    }

    public UserCms(UserCms userCms) {
        this.password = userCms.password;
        this.email = userCms.email;
        this.isActive = true;
        this.id = userCms.getId();
        this.isDeleted = false;
        this.createdAt = new Date();
        this.name = userCms.name;
    }
    
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public boolean isIsActive() {
        return isActive;
    }

    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean isIsLocked() {
        return isLocked;
    }

    public void setIsLocked(boolean isLocked) {
        this.isLocked = isLocked;
    }

    public int getLastAttempt() {
        return lastAttempt;
    }

    public void setLastAttempt(int lastAttempt) {
        this.lastAttempt = lastAttempt;
    }

    public Date getLastLogin() {
        return lastLogin;
    }

    public void setLastLogin(Date lastLogin) {
        this.lastLogin = lastLogin;
    }
}
