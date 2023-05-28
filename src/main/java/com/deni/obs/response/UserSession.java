package com.deni.obs.response;

public class UserSession {
    private String access_token;
    private String expired_date;
    private String user_type;
    private String profile_data;
    private String features;

    public String getAccess_token() {
        return access_token;
    }

    public void setAccess_token(String access_token) {
        this.access_token = access_token;
    }

    public String getExpired_date() {
        return expired_date;
    }

    public void setExpired_date(String expired_date) {
        this.expired_date = expired_date;
    }

    public String getUser_type() {
        return user_type;
    }

    public void setUser_type(String user_type) {
        this.user_type = user_type;
    }

    public String getProfile_data() {
        return profile_data;
    }

    public void setProfile_data(String profile_data) {
        this.profile_data = profile_data;
    }

    public String getFeatures() {
        return features;
    }

    public void setFeatures(String features) {
        this.features = features;
    }
}
