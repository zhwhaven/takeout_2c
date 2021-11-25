package com.takeout.service;

import com.takeout.pojo.Carson;
import com.takeout.pojo.Shopcar;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface shopcarService {
    public List<Carson> selectShopcar(int user_id);

    //    根据食品id和用户id删除购物车
    public int deleteShopcar(int foodID, int userID);
//     根据食品id和用户id和修改的数值change修改购物车的食物的数量
    public int updateCount(Shopcar shopcar,int change);
//    根据shopcarid删除购物车
    public int deleteShopcarById(int id);
}
