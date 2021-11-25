package com.takeout;

import com.takeout.dao.adminMapper;
import com.takeout.dao.businessMapper;
import com.takeout.pojo.Business;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class testAdmin {
    @Autowired
    private adminMapper mapper;

    @Test
    public void t1(){
        List<Business> businessList = mapper.selectApply();
        for (Business business : businessList) {
            System.out.println(business);
        }
    }
    @Test
    public void t2(){
        Business business=new Business();
        business.setId(2);
        business.setStatus(1);
        mapper.dealBusiness(business);
    }
    @Test
    public void t3(){
//        int i = mapper.adminLogin("abcd1234", "abcd1234");
//        System.out.println(i);
    }
}
