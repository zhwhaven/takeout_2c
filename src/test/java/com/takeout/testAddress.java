package com.takeout;

import com.takeout.dao.receive_mMapper;
import com.takeout.pojo.Receive;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class testAddress {
    @Autowired
    receive_mMapper mapper;
    @Test
    public void t1(){
        Receive receive=new Receive();
       receive.setAddress("玫瑰园47栋");
       receive.setName("陈国栋");
       receive.setPhoneNumber("1580263089");
        int i = mapper.addAddress(receive);
        System.out.println(receive.getId());
    }
    @Test
    public void t2(){
        Receive receive=new Receive();
        receive.setAddress("玫瑰园45栋");
        receive.setName("阿并");
        receive.setPhoneNumber("1580285555");
        receive.setId(4);
        int i = mapper.updateAddress(receive);
        System.out.println(i);
    }
    @Test
    public void t3(){
        Receive receive = mapper.selectAddress(1);
        System.out.println(receive);
    }
    @Test
    public void t4(){
        int i = mapper.deleteAddress(4);
        System.out.println(i);
    }
}
