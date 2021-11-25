package com.takeout.dao;

import com.takeout.pojo.Order;

import java.util.List;

public interface orderMapper {
//    将数据提交到order
    public int submitConfirm(List<Order> orderList);
//    将数据添加到order
    public int addOrder(Order order);
}
