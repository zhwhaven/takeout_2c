package com.takeout.service.impl;

import com.takeout.dao.confirmMapper;
import com.takeout.dao.shopcarMapper;
import com.takeout.pojo.Business;
import com.takeout.pojo.Cargrandson;
import com.takeout.pojo.Carson;
import com.takeout.pojo.Shopcar;
import com.takeout.service.confirmService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
@Service
public class confirmServiceImpl implements confirmService {
    @Autowired
    private confirmMapper confirmMapper;
    @Autowired
    private shopcarMapper shopcarMapper;
    @Override
    public List<Carson> selectAll(List<Integer> list,int userid) {
        List<Shopcar> shopcars = shopcarMapper.selectAllShopcarByList(list);
        List<Carson> carsonList=new ArrayList<Carson>();
        if(shopcars!=null){
            int i = shopcarMapper.addShopcarToConfirm(shopcars);
            System.out.println("添加到确认表"+i);
            if(i!=0){
//        通过用户查询到购物车中与用户有关的店铺信息
                List<Business> businesses = confirmMapper.selectBusinessByUserid(userid);
                for (Business business : businesses) {
                    Carson carson=new Carson();
                    carson.setBusiness(business);
//            通过店铺id和用户id 得到食品信息和购买数量
                    List<Cargrandson> cargrandsons = confirmMapper.selectFoodAndCount(business.getId(), userid);
                    carson.setCargrandsonList(cargrandsons);
                    carsonList.add(carson);
                }
                System.out.println(carsonList);

            }
//            清空确认表
            confirmMapper.deleteAll();
        }

      return carsonList;
    }
}
