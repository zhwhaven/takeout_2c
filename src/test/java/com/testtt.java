package com;

import com.takeout.dao.userMapper;
import com.takeout.pojo.User;
import com.takeout.util.TimeUtils;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.xml.crypto.Data;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class testtt {
    @Autowired
    private userMapper mapper;

    @Test
    public void t1() {
        User user = mapper.selectUser(2);
        System.out.println(user);

    }

    @Test

    public void t2() throws InterruptedException {
        Calendar calendar = Calendar.getInstance(); // get current instance of the calendar
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-mm-dd HH:mm:ss");
        Date x = calendar.getTime();
//        Date  p=new Date(formatter.format(calendar.getTime()));
//        System.out.println(p);
        System.out.println(x);
        System.out.println(calendar.getTime().getTime());
        System.out.println();
        Thread.sleep(1000);
//        Calendar calendar1 = Calendar.getInstance();
//        System.out.println(formatter.format(calendar1.getTime()));
//        System.out.println(calendar1.getTime().getTime());
//        long t=30*60*1000;
//        System.out.println(t);

    }

    @Test
    //    订单时间处理
    public void tt6() {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        Calendar calendar = Calendar.getInstance();
        Date date = calendar.getTime();

        System.out.println(date);
        long time = date.getTime();
        System.out.println(time);

        String format = formatter.format(date);
        System.out.println(format);
        long xx=time+1000;

        Date d2=new Date(xx);
        System.out.println(d2);

    }
    @Test
    public void tt(){
        String finishTime = TimeUtils.getFinishTime(1800);
        System.out.println(finishTime);
    }

    //    营业时间处理
//    @Test
//    public void tt7() {
//        LocalTime localTime = LocalTime.now();
//        System.out.println(localTime);
//        int hour = localTime.getHour();
//        int minute = localTime.getMinute();
//        int nano = localTime.getNano();
//        int second = localTime.getSecond();
//        System.out.println(hour);
//        System.out.println(minute);
//        System.out.println(second);
//        System.out.println(nano);
//        DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("HH:mm:ss");
//        String time = localTime.format(dateTimeFormatter);
//        System.out.println(time);
//    }
//
    @Test
//    页面展示时，根据营业时间
    public void tt8(){
        LocalTime localTime = LocalTime.now();
        int i = localTime.toSecondOfDay();
        long l = localTime.toNanoOfDay();
        System.out.println(localTime);
        System.out.println(i);
        System.out.println(l);

    }
    @Test
//    获得ip地址
    public void tt9(){

                     try {
                InetAddress address = InetAddress.getLocalHost();
                System.out.println("Host Name: " + address.getHostName());
                System.out.println("Host Address: " + address.getHostAddress());
            } catch (UnknownHostException e) {
                e.printStackTrace();
            }
               }

}