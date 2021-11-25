package com.takeout.dao;

import com.takeout.pojo.Business;
import com.takeout.pojo.Cargrandson;
import com.takeout.pojo.Shopcar;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface shopcarMapper {
//    通过用户id 查询商人id
    public List<Integer> selectBsIDByUid(int userID);
//    通过用户id 查询与用户有关的购物车中的商人信息
    public List<Business> selectBusinessByUserid(int userID);
//    通过商人id 和用户id 查询 foodid and count
    public List<Cargrandson> selectFoodAndCount(@Param("bsID") int bsID,@Param("userID")int userID);
//   将食物添加到购物车
    public int addShopcar(Shopcar shopcar);
//    根据食品id和用户id删除购物车
    public int deleteShopcar(@Param("foodID") int foodID,@Param("userID") int userID);
//   通过userid 和 foodid 查询对象是否存在
    public Shopcar selectShopcar(@Param("foodID") int foodID,@Param("userID") int userID);
//    修改count，通过userid 和 foodid ,修改值change
    public  int updateCount(@Param("foodID") int foodID,@Param("userID") int userID,@Param("change") int change);
// 通过shopcarid删除购物车
    public int deleteShopcarById(int id);
//  根据shopcarid的集合
    public List<Shopcar> selectAllShopcarByList(List<Integer> shopcaridlist);
//    将上一个查到的shopcar集合的数据插入到t_confirm表中
    public int  addShopcarToConfirm(List<Shopcar> shopcarList);
//    根据shopcarid的集合删除数据
    public int deleteShopcarList(List<Integer> shopcaridlist);
}
