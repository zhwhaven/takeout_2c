package com.takeout.service;

import com.takeout.pojo.Food;

import java.util.List;

public interface shopService {
    public int uploadFood(int bs_id, Food food);

    List<Food> selectFoodByUid(int id);

    int updateFood(Food food);

    int deleteFood(int id);
}
