package com.takeout.dao;

import com.takeout.pojo.Receive;
import org.apache.ibatis.annotations.Param;

public interface receive_mMapper {
//    添加地址
   public int addAddress(Receive receive);
//   删除地址
    public int deleteAddress(int id);
//    修改地址
    public int updateAddress(Receive receive);
//    查询地址
    public Receive selectAddress(int id);
//   查询用户所在地址
}
