package com.takeout.dao;

import com.takeout.pojo.Receive;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface user_receiveMapper {
//    增加用户和地址的关联
    public int addUserReceive(@Param("uid")int uid,@Param("rmid")int rmid);
//    删除用户和地址的关联
    public int deleteUserReceive(@Param("uid")int uid,@Param("rmid")int rmid);
//    查看与用户有关的所有地址的id
    public List<Integer> selectAllAddress(@Param("uid")int uid);
//  //    查看与用户有关的所有地址
   public List<Receive> selectAllAddressList(@Param("uid")int uid);
}
