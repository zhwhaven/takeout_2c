package com.takeout.dao;

import com.takeout.pojo.Admin;
import com.takeout.pojo.Business;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface adminMapper {
//    表名：t_admin
    //    管理员对用户申请进行处理，status为 1 通过，-1 不通过
    public int dealBusiness(Business business);
    //    管理员查看所有申请名单
    public List<Business> selectApply();
//    管理员登录
    public Admin adminLogin(@Param("admin_account")String admin_account,
                            @Param("admin_password")String admin_password);
}
