package com.takeout.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class TimeUtils {
    public static String getFinishTime(int set_time){
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//获得当前时间
        Calendar calendar = Calendar.getInstance();
        Date date = calendar.getTime();
        long time = date.getTime();

//    获得修改后的时间
        long xx=time+set_time*1000;
        Date d2=new Date(xx);
        String finish = formatter.format(d2);
        return finish;
    }
    public static String getNowTime(){
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        //获得当前时间
        Calendar calendar = Calendar.getInstance();
        Date date = calendar.getTime();
        String finish = formatter.format(date);
        return finish;
    }
}
