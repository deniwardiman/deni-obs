package com.deni.obs.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;

/**
 * @author hendriksaragih
 */
@Configuration
@PropertySource("classpath:application.properties")
public class ConstantConfig {
    @Autowired
    private Environment env;

    private static ConstantConfig instance = null;

    private String baseUrl = null;
    private String imagePath = null;
    private String fcmKey = null;
    private String imageUrl = null;
    private String instantCarUrl = null;
    private String instantCarApiKey = null;
    private String webURL = null;
    private String bypassLogin = null;
    private String espaySignature = null;
    private String espayPassword = null;
    private String espayUrl = null;
    private String espayKey = null;
    private String espayCommCode = null;
    private String espayClientId = null;
    private String espayFTUsername = null;
    private String espayFTPassword = null;
    private String espayFTClientSecretKey = null;
    private String espayFTSenderId = null;
    private String espayFTSourceBankCode = null;
    private String espayFTSourceBankAcc = null;
    private String serverTimezone = null;
    private String portalB2BUrl = null;
    private String busTravelUrl = null;
    private String busTravelFlashSaleServiceUrl = null;
    private String busTravelPromoServiceUrl = null;
    private String busTravelTransportationServiceUrl = null;
    private String busTravelTransactionServiceUrl = null;
    private String busTravelMasterServiceUrl = null;
    private String busTravelImagePath = null;
    private String moengageUrl = null;
    private String moengageUsername = null;
    private String moengagePassword = null;
    private String googleMapKey = null;
    private String movicCoreBaseUrl = null;
    private String fbUrl = null;
    private String twUrl = null;
    private String igUrl = null;
    private String inUrl = null;
    private String ytUrl = null;
    private String appAndroidUrl = null;
    private String appIosUrl = null;
    private String webAboutUrl = null;
    private String webHowToRentUrl = null;
    private String webHelpUrl = null;
    private String emailSender = null;
    private String webUnsubscribeUrl = null;

    @Bean
    public static ConstantConfig getInstance() {
        if (instance == null) {
            instance = new ConstantConfig();
        }

        return instance;
    }

    public String getBaseUrl() {
        if (baseUrl  == null){
            baseUrl  = env.getProperty("movic.base.url");
        }
        return baseUrl ;
    }

    public String getBaseBusTravelUrl() {
        if (baseUrl  == null){
            baseUrl  = env.getProperty("capcus.base.url");
        }
        return baseUrl ;
    }

    public String getBusTravelUrl() {
        if (busTravelUrl == null) {
            busTravelUrl = env.getProperty("movic.bus-travel.url");
        }
        return busTravelUrl;
    }

    public String getImageUrl() {
        if (imageUrl == null){
            imageUrl = env.getProperty("movic.images.url");
        }
        return imageUrl;
    }
    public String getImageUrlInstantCar() {
        if (imageUrl == null){
            imageUrl = env.getProperty("movic.images.url-instantcar") + "files/instant-car/";
        }
        return imageUrl;
    }

    public String getAuthInstantCar() {
        if (instantCarUrl == null){
            instantCarUrl = env.getProperty("movic.url-instantcar");
        }
        return instantCarUrl;
    }
    public String getApiKeyInstantCar() {
        if (instantCarApiKey == null){
            instantCarApiKey = env.getProperty("movic.instantcar-api-key");
        }
        return instantCarApiKey;
    }

    public String getImagePath() {
        if (imagePath == null){
            imagePath = env.getProperty("movic.images.path");
        }
        return imagePath;
    }

    public String getFcmKey() {
        if (fcmKey == null){
            fcmKey = env.getProperty("movic.firebase.key");
        }
        return fcmKey;
    }

    public String getWebUrl() {
        if (webURL == null) {
            webURL = env.getProperty("movic.web.url");
        }
        return webURL;
    }

    public String getWebUnsubscribeUrl() {
        if (webUnsubscribeUrl == null) {
            webUnsubscribeUrl = getWebUrl() + env.getProperty("movic.web.unsubscribe-path");
        }
        return webUnsubscribeUrl;
    }

    public String getFbUrl() {
        if (fbUrl == null) {
            fbUrl = env.getProperty("movic.fb.url");
        }
        return fbUrl;
    }

    public String getTwUrl() {
        if (twUrl == null) {
            twUrl = env.getProperty("movic.tw.url");
        }
        return twUrl;
    }

    public String getIgUrl() {
        if (igUrl == null) {
            igUrl = env.getProperty("movic.ig.url");
        }
        return igUrl;
    }

    public String getInUrl() {
        if (inUrl == null) {
            inUrl = env.getProperty("movic.in.url");
        }
        return inUrl;
    }

    public String getYtUrl() {
        if (ytUrl == null) {
            ytUrl = env.getProperty("movic.yt.url");
        }
        return ytUrl;
    }

    public String getAppAndroidUrl() {
        if (appAndroidUrl == null) {
            appAndroidUrl = env.getProperty("movic.app.android.url");
        }
        return appAndroidUrl;
    }

    public String getAppIosUrl() {
        if (appIosUrl == null) {
            appIosUrl = env.getProperty("movic.app.ios.url");
        }
        return appIosUrl;
    }

    public String getWebAboutUrl() {
        if (webAboutUrl == null) {
            webAboutUrl = getWebUrl() + env.getProperty("movic.web.about-path");
        }
        return webAboutUrl;
    }

    public String getWebHowToRentUrl() {
        if (webHowToRentUrl == null) {
            webHowToRentUrl = getWebUrl() + env.getProperty("movic.web.howtorent-path");
        }
        return webHowToRentUrl;
    }

    public String getWebHelpUrl() {
        if (webHelpUrl == null) {
            webHelpUrl = getWebUrl() + env.getProperty("movic.web.help-path");
        }
        return webHelpUrl;
    }

    public Boolean isBypassLogin() {
        if (bypassLogin == null) {
            bypassLogin = env.getProperty("movic.bypass.login");
        }
        return "true".equals(bypassLogin);
    }

    public String getPortalB2BUrl() {
        if (portalB2BUrl == null) {
            portalB2BUrl = env.getProperty("movic.portalb2b.url");
        }
        return portalB2BUrl;
    }


    public String getEspaySignature() {
        if (espaySignature == null) {
            espaySignature = env.getProperty("espay.signature");
        }
        return espaySignature;
    }

    public String getEspayUrl() {
        if (espayUrl == null) {
            espayUrl = env.getProperty("espay.url");
        }
        return espayUrl;
    }

    public String getEspayKey() {
        if (espayKey == null) {
            espayKey = env.getProperty("espay.key");
        }
        return espayKey;
    }

    public String getEspayPassword() {
        if (espayPassword == null) {
            espayPassword = env.getProperty("espay.password");
        }
        return espayPassword;
    }

    public String getEspayCommCode() {
        if (espayCommCode == null) {
            espayCommCode = env.getProperty("espay.commcode");
        }
        return espayCommCode;
    }

    public String getEspayClientId() {
        if (espayClientId == null) {
            espayClientId = env.getProperty("espay.clientid");
        }
        return espayClientId;
    }

    public String getEspayFTUsername() {
        if (espayFTUsername == null) {
            espayFTUsername = env.getProperty("espay.ft.username");
        }
        return espayFTUsername;
    }

    public String getEspayFTPassword() {
        if (espayFTPassword == null) {
            espayFTPassword = env.getProperty("espay.ft.password");
        }
        return espayFTPassword;
    }

    public String getEspayFTClientSecretKey() {
        if (espayFTClientSecretKey == null) {
            espayFTClientSecretKey = env.getProperty("espay.ft.secretkey");
        }
        return espayFTClientSecretKey;
    }

    public String getEspayFTSenderId() {
        if (espayFTSenderId == null) {
            espayFTSenderId = env.getProperty("espay.ft.sender");
        }
        return espayFTSenderId;
    }

    public String getEspayFTSourceBankCode() {
        if (espayFTSourceBankCode == null) {
            espayFTSourceBankCode = env.getProperty("espay.ft.source_bank_code");
        }
        return espayFTSourceBankCode;
    }

    public String getEspayFTSourceBankAcc() {
        if (espayFTSourceBankAcc == null) {
            espayFTSourceBankAcc = env.getProperty("espay.ft.source_bank_acc");
        }
        return espayFTSourceBankAcc;
    }

    public String getServerTimezone() {
        if (serverTimezone == null) {
            serverTimezone = env.getProperty("server.timezone");
        }
        return serverTimezone;
    }

    public String getBusTravelFlashSaleServiceUrl() {
        if (busTravelFlashSaleServiceUrl == null) {
            busTravelFlashSaleServiceUrl = getBusTravelUrl() + env.getProperty("movic.bus-travel.flash-sale-path");
        }
        return busTravelFlashSaleServiceUrl;
    }

    public String getBusTravelPromoServiceUrl() {
        if (busTravelPromoServiceUrl == null) {
            busTravelPromoServiceUrl = getBusTravelUrl() + env.getProperty("movic.bus-travel.promo-path");
        }
        return busTravelPromoServiceUrl;
    }

    public String getBusTravelTransportationServiceUrl() {
        if (busTravelTransportationServiceUrl == null) {
            busTravelTransportationServiceUrl = getBusTravelUrl() + env.getProperty("movic.bus-travel.transportation-path");
        }
        return busTravelTransportationServiceUrl;
    }

    public String getBusTravelTransactionServiceUrl() {
        if (busTravelTransactionServiceUrl == null) {
            busTravelTransactionServiceUrl = getBusTravelUrl() + env.getProperty("movic.bus-travel.transaction-path");
        }
        return busTravelTransactionServiceUrl;
    }

    public String getBusTravelMasterServiceUrl() {
        if (busTravelMasterServiceUrl == null) {
            busTravelMasterServiceUrl = getBusTravelUrl() + env.getProperty("movic.bus-travel.master-path");
        }
        return busTravelMasterServiceUrl;
    }

    public String getBusTravelImagePath() {
        if (busTravelImagePath == null) {
            busTravelImagePath = getBusTravelUrl() + env.getProperty("movic.bus-travel.image-path");
        }
        return busTravelImagePath;
    }

    public HttpHeaders getBusTravelRequestHeaders() {
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.set("X-Sejalan-Api-Key", env.getProperty("movic.bus-travel.api-key"));
        return headers;
    }

    public String getMoengageUrl() {
        if (moengageUrl == null) {
            moengageUrl = env.getProperty("moengage.url");
        }
        return moengageUrl;
    }

    public String getMoengageUsername() {
        if (moengageUsername == null) {
            moengageUsername = env.getProperty("moengage.username");
        }
        return moengageUsername;
    }

    public String getMoengagePassword() {
        if (moengagePassword == null) {
            moengagePassword = env.getProperty("moengage.password");
        }
        return moengagePassword;
    }

    public String getGoogleMapKey() {
        if (googleMapKey == null) {
            googleMapKey = env.getProperty("movic.google.map.key");
        }
        return googleMapKey;
    }

    public String getMovicCoreBaseUrl() {
        if (movicCoreBaseUrl == null) {
            movicCoreBaseUrl = env.getProperty("movic.core.url");
        }
        return movicCoreBaseUrl;
    }

    public String getEmailSender() {
        if (emailSender == null) {
            emailSender = env.getProperty("movic.email.sender");
        }
        return emailSender;
    }
}
