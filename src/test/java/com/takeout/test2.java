package com.takeout;

import com.takeout.pojo.User;
import com.takeout.service.userService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class test2 {
    @Autowired
    private com.takeout.service.userService userService;
    @Test
    public void tt1(){
        User user=new User();
        user.setAccount("085800");
        user.setUserName("00010");
        user.setPassword("00010");
        user.setPhoneNumber("001000");
        int i = userService.addUser(user);
        System.out.println(i);
    }
}
