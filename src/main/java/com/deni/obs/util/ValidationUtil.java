package com.deni.obs.util;

import java.util.Collection;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ValidationUtil {

    public static final String NUMBER_PATTERN = "\\d+";
    public static final String STRING_PATTERN = "^[a-zA-Z].*";
    public static final String PHONE_PATTERN = "^(([0-9]){6,15})$";
    public static final String EMAIL_PATTERN = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@" + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
    public static final String URL_PATTERN = "(https?:\\/\\/(?:www\\.|(?!www))[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\\.[^\\s]{2,}|www\\.[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\\.[^\\s]{2,}|https?:\\/\\/(?:www\\.|(?!www))[a-zA-Z0-9]+\\.[^\\s]{2,}|www\\.[a-zA-Z0-9]+\\.[^\\s]{2,})";
    public static final String BANK_CODE_REGEX = "^[\\d]{3}$";
    public static final String UUID_PATTERN = "^[\\w]{8}-[\\w]{4}-[\\w]{4}-[\\w]{4}-[\\w]{12}";
    public static final String KTP_REGEX = "^[\\d]{16}$";
    public static final String SIM_REGEX = "^[\\d]{12}$";

    public static boolean isNotEmptyOrNull(Object obj) {
        if (obj == null) return false;
        if (obj instanceof String)
            return !((String) obj).isEmpty();
        else if (obj instanceof Collection)
            return ((Collection<?>) obj).size() != 0;
        return true;
    }

    public static boolean isEmptyOrNull(Object obj) {
        if (obj == null) return true;
        if (obj instanceof String)
            return ((String) obj).isEmpty();
        else if (obj instanceof Collection)
            return ((Collection<?>) obj).size() == 0;
        return false;
    }

    public static boolean regexValidate(String value, String regex) {
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(value);

        return matcher.matches();
    }
}
