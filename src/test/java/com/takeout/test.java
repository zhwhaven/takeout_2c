package com.takeout;

import com.takeout.dao.userMapper;
import com.takeout.pojo.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.xml.crypto.Data;
import java.util.Date;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class test {
    @Autowired
    private userMapper mapper;
    @Test
    public void tt1(){
        User user = mapper.selectUser(2);
        System.out.println(user);
    }
    @Test
    public void tt2(){
        User user=new User();
        user.setAccount("6666");
        user.setUserName("haoyf");
        user.setPassword("88598");
        user.setPhoneNumber("15889948");
        int i = mapper.addUser(user);
        System.out.println(i);
    }
    @Test
    public void tt3(){
        User user=new User();
        user.setId(11);
        user.setAccount("2222");
        user.setUserName("2222");
        user.setPassword("222");
        user.setPhoneNumber("222");
        int i = mapper.updateUser(user);
        System.out.println(i);
    }
    @Test
    public void tt4(){
        int i = mapper.deleteUserById(11);
        System.out.println(i);
    }
    @Test
    public void tt8() throws InterruptedException {
        System.out.println(new Date().getTime());
       Date t= new Date();
        Thread.sleep(1000);
        System.out.println(new Date().getTime());
        Date f= new Date();

    }
    @Test
    public void tt7(){

//        String[] s=x2.split("webapp/");
//        String realName= s[s.length-1];
//        System.out.println(x2);
//        System.out.println(realName);
    }
}
