package com.takeout.dao;

import com.takeout.pojo.Food;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface foodMapper {
//    添加食品,并返回id
    public int addFood(Food food);
//    删除食品
    public int deleteFood(int id);
//    修改食品信息
    public int updateFood(Food food);
//    查询食物
    public Food selectFood(int id);
//   修改数量信息
    public int updateFoodCount(@Param("foodid")int foodid,@Param("count")int count);
//修改名字，数量，价格
    public int updateFoodBy(Food food);
}
