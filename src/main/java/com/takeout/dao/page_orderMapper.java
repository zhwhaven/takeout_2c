package com.takeout.dao;

import com.takeout.pojo.Cargrandson;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface page_orderMapper {
//    添加包和订单的联系
    public int addPageAndOrder(@Param("pageid")int pageid,@Param("orderid")int orderid);
//    查找出与page有关的order集合
    public List<Cargrandson> selectByPageId(int pageid);
}
