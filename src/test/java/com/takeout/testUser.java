package com.takeout;

import com.alibaba.druid.support.json.JSONUtils;
import com.takeout.dao.userMapper;
import com.takeout.pojo.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class testUser {
    @Autowired
    userMapper mapper;
    @Test
    public void t1(){
        User user=new User();
        user.setAccount("00001");
        user.setPassword("1477112645");
        User login = mapper.login(user);
        System.out.println(user);
    }
}
