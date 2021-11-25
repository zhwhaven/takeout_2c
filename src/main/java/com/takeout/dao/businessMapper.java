package com.takeout.dao;

import com.takeout.pojo.Business;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface businessMapper {
//    申请加入，status为0
    public int addBusiness(Business business);
//    用户修改自己的信息
    public int updateBusiness(Business business);
//    用户通过手机号码查看，申请是否通过
    public int selectStatusByPhone(String phone);
//    登录
    public Business bsLogin(Business business);
//       通过地点得到店铺
    public List<Business> selectStoreByAddress(String address);
//    通过id查所有信息
    public Business selectById(int id);
//通过时间，地点和营业状态 查询店铺
    List<Business> selectBusinessByAddressAndTime(@Param("nowTime") long nowTime, @Param("address") String address);
//查询所有商家信息
    List<Business> selectAll();
//批准
    int updateStatus(int id);
//    删除商家
    int deleteBusiness(int id);
    //    用户通过手机号码查看，申请是否通过,返回用户
    public Business selectStatus(String phone);
//通过keyword和address得到
    List<Business> selectBusinessByKey(@Param("address") String address,@Param("keyword") String keyword);
}
