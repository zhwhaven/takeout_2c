package com.takeout;

import com.takeout.dao.bs_foodMapper;
import com.takeout.pojo.Food;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class testfood_id {
    @Autowired
    private bs_foodMapper mapper;
    @Test
    public void t1(){
        int i = mapper.addBs_food(2, 9);
        System.out.println(i);
    }
    @Test
    public void t2(){
        int i = mapper.deleteBs_food(2, 3);
        System.out.println(i);
    }
    @Test
    public void t3(){
        List<Integer> integers = mapper.selectAllFoodId(2);
        System.out.println(integers);
    }
    @Test
    public void t4(){
        List<Food> foods = mapper.selectAllFood(12);
        System.out.println(foods);
    }

}
