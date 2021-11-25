package com.takeout.dao;

import com.takeout.pojo.Food;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface bs_foodMapper {
//   表名：bs_food
//    添加商家和食品的联系
    public int addBs_food(@Param("bs_id") int bs_id,@Param("food_id") int food_id);
    //    删除商家和食品的联系
    public int deleteBs_food(@Param("bs_id") int bs_id,@Param("food_id") int food_id);
//    查找属于用户的所有食品的id
    public List<Integer> selectAllFoodId(@Param("bs_id") int bs_id);
//    查找属于商家的所有食品的信息
    public List<Food> selectAllFood(@Param("bs_id") int bs_id);

}
