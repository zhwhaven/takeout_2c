package com.takeout.dao;

import com.takeout.pojo.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface pageMapper {
//    添加数据并返回id
    public int addPage(Page page);
//   根据用户id查询page
    public List<Page> selectPageByUserId(int userid);
//    根据商家id查询page
    public List<Page> selectPageByBusinessId(int businessId);
//修改订单状态
    int updateStatus(@Param("pageid") int pageid, @Param("status") int status);
}
