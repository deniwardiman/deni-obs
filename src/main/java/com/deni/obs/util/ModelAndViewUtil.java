package com.deni.obs.util;

import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class ModelAndViewUtil {

    public static final SimpleDateFormat simpleDateFormat = new SimpleDateFormat("MM/dd/yyyy HH:mm");
    public static final SimpleDateFormat simpleDateFormat1 = new SimpleDateFormat("MM-dd-yyyy HH:mm");
    public static final SimpleDateFormat jsDate = new SimpleDateFormat("MM-dd-yyyy");
    public static final SimpleDateFormat sdfDate = new SimpleDateFormat("MM/dd/yyyy");
    public static final SimpleDateFormat sdfHour = new SimpleDateFormat("HH");
    public static final SimpleDateFormat sdfMinute = new SimpleDateFormat("mm");
    public static Calendar cal = Calendar.getInstance();
    private static Date now;

    public static List<String> hours() {
        List<String> hoursList = new ArrayList<>();
        for (int i = 0; i < 24; i++) {
            String tmp = "0" + i;
            tmp = tmp.substring(tmp.length() - 2);
            hoursList.add(tmp);
        }
        return hoursList;
    }

    public static List<String> minutes() {
        List<String> minuteList = new ArrayList<>();
        for (int i = 0; i < 60; i++) {
            String tmp = "0" + i;
            tmp = tmp.substring(tmp.length() - 2);
            minuteList.add(tmp);
        }
        return minuteList;
    }

    public static String dateNow(Date date) {
        return jsDate.format(date);
    }

    public static String hourNow(Date date) {
        return sdfHour.format(date);
    }

    public static String minuteNow(Date date) {
        return sdfMinute.format(date);
    }

    public static void addObjectHoursAndMinutes(ModelAndView model) {
        model.addObject("hours", hours());
        model.addObject("minutes", minutes());
    }

    public static void addObjectFromDateHourMinute(HttpServletRequest request, ModelAndView model) {
        cal.add(Calendar.HOUR, 1);
        model.addObject("fromDate", sdfDate.format(now));
        model.addObject("fromHour", sdfHour.format(now));
        model.addObject("fromMinute", sdfMinute.format(now));
    }

    public static void addObjectDayOptions(ModelAndView model) {
        model.addObject("isAllDay", true);
        model.addObject("day1", true);
        model.addObject("day2", true);
        model.addObject("day3", true);
        model.addObject("day4", true);
        model.addObject("day5", true);
        model.addObject("day6", true);
        model.addObject("day7", true);
    }
}
