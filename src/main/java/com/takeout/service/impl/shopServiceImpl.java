package com.takeout.service.impl;

import com.takeout.dao.bs_foodMapper;
import com.takeout.dao.foodMapper;
import com.takeout.pojo.Food;
import com.takeout.service.shopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class shopServiceImpl implements shopService {
    @Autowired
    private com.takeout.dao.foodMapper foodMapper;
    @Autowired
    private bs_foodMapper bsFoodMapper;
    @Override
    public int uploadFood(int bs_id, Food food) {
        int i = foodMapper.addFood(food);
        System.out.println("添加食物成功"+i);
        int i1 = bsFoodMapper.addBs_food(bs_id, food.getId());
        System.out.println("添加食物联系商人"+i1);
        return i1;
    }

    @Override
    public List<Food> selectFoodByUid(int id) {
        List<Food> foodList = bsFoodMapper.selectAllFood(id);
        return foodList;
    }

    @Override
    public int updateFood(Food food) {
        int i = foodMapper.updateFoodBy(food);
        return i;
    }

    @Override
    public int deleteFood(int id) {
        int i = foodMapper.deleteFood(id);
        return i;
    }
}
