package com.takeout;

import com.takeout.pojo.Carson;
import com.takeout.service.confirmService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.ArrayList;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class testConfirm {
    @Autowired
    confirmService confirmService;
    @Test
    public void t1(){
            List<Integer> list=new ArrayList<Integer>();
            list.add(10);
            list.add(11);
            list.add(12);
        List<Carson> carsonList = confirmService.selectAll(list, 11);
        System.out.println(carsonList);
    }
}
