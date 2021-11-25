package com.takeout.service;

import com.takeout.pojo.Carson;

import java.util.List;

public interface orderService {
    public int submitConfirm(int userid,int receiveid,int[] shopcaridList,int[] foodidList,int[] foodcountList,int[] bsidlist,int[] setlist,int[] bdlist);
    //查询出订单所有的信息（用户）
    public List<Carson> selectAllOrdersByUser(int userid);
//    查询出订单所有的信息（商家）
 public List<Carson> selectAllOrdersByBsid(int bsid);
   //修改订单状态
    int changeStatus(int pageid, int status);
}
