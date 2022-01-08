package com.takeout;

import com.takeout.dao.foodMapper;
import com.takeout.pojo.Food;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class testFood {
    @Autowired
    private foodMapper mapper;
    @Test
    public void t1(){
        Food food=new Food();
        food.setFoodName("鸡腿huhuhuhu");
        food.setFoodPicture("鸡腿jijiji图片");
        food.setFoodDiscount(0.9);
        food.setFoodPrice(7);
        food.setFoodCount(20);
        food.setSet_time(20);
        food.setFood_describe("好吃大鸡腿uim");
        food.setFood_style_code("0002");
         int i=mapper.addFood(food);
        System.out.println("i"+"---->"+i);
        int id = food.getId();
        System.out.println(id);
    }
    @Test
    public void t2(){
        Food food = mapper.selectFood(13);
        System.out.println(food);
    }
    @Test
    public void t3(){
        Food food=new Food();
        food.setFoodName("鸡腿");
        food.setFoodPicture("鸡腿图片");
        food.setFoodDiscount(0.9);
        food.setFoodPrice(7);
        food.setFoodCount(20);
        food.setSet_time(20);
        food.setId(13);
        food.setFood_describe("好吃大鸡腿");
        food.setFood_style_code("0002");
        int i=mapper.updateFood(food);
//        int id = food.getId();
        System.out.println(i);
    }
    @Test
    public void t4(){
        int i = mapper.deleteFood(12);
        System.out.println(i);
    }
}
