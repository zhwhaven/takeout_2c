package com.takeout.dao;

import com.takeout.pojo.Business;
import com.takeout.pojo.Cargrandson;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface confirmMapper {

//    清空购物车的数据
    public int deleteAll();
    //    通过用户id 查询与用户有关的购物车中的商人信息
    public List<Business> selectBusinessByUserid(int userID);
    //    通过商人id 和用户id 查询 foodid and count
    public List<Cargrandson> selectFoodAndCount(@Param("bsID") int bsID, @Param("userID")int userID);
}
