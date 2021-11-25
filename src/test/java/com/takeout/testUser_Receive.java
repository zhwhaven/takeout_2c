package com.takeout;

import com.takeout.dao.user_receiveMapper;
import com.takeout.pojo.Receive;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class testUser_Receive {
    @Autowired
   private user_receiveMapper mapper;
    @Test
    public void t1(){
        int i = mapper.addUserReceive(1, 1);
        System.out.println(i);
    }
    @Test
    public void t2(){
        List<Integer> integers = mapper.selectAllAddress(1);
        System.out.println(integers);
    }
    @Test
    public void t3(){
        int i = mapper.deleteUserReceive(1, 1);
        System.out.println(i);
    }
    @Test
    public void t4(){
        List<Receive> receiveList = mapper.selectAllAddressList(3);
        System.out.println(receiveList);
    }
}
