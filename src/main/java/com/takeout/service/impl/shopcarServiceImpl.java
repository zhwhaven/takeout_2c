package com.takeout.service.impl;

import com.takeout.dao.businessMapper;
import com.takeout.dao.foodMapper;
import com.takeout.dao.shopcarMapper;
import com.takeout.pojo.Business;
import com.takeout.pojo.Cargrandson;
import com.takeout.pojo.Carson;
import com.takeout.pojo.Shopcar;
import com.takeout.service.shopcarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
@Service
public class shopcarServiceImpl implements shopcarService {
    @Autowired
    private com.takeout.dao.shopcarMapper shopcarMapper;
    @Autowired
    private com.takeout.dao.foodMapper foodMapper;
    @Autowired
    private com.takeout.dao.businessMapper businessMapper;
    @Override
    public List<Carson> selectShopcar(int  user_id) {
        List<Carson> carsonList=new ArrayList<Carson>();
//        通过用户查询到购物车中与用户有关的店铺信息
        List<Business> businesses = shopcarMapper.selectBusinessByUserid(user_id);
        for (Business business : businesses) {
            Carson carson=new Carson();
            carson.setBusiness(business);
//            通过店铺id和用户id 得到食品信息和购买数量
            List<Cargrandson> cargrandsons = shopcarMapper.selectFoodAndCount(business.getId(), user_id);
            carson.setCargrandsonList(cargrandsons);
            carsonList.add(carson);
        }
        System.out.println(carsonList);
        return carsonList;
    }

    @Override
    public int deleteShopcar(int foodID, int userID) {
        int i = shopcarMapper.deleteShopcar(foodID, userID);
        return i;
    }

    //     根据食品id和用户id和修改的数值change修改购物车的食物的数量
    @Override
    public int updateCount(Shopcar shopcar, int change) {
        int k=0;
        Shopcar shopcar1 = shopcarMapper.selectShopcar(shopcar.getFoodID(), shopcar.getUserID());
        if(shopcar1==null){
            if(change==1){
                shopcar.setCount(1);
                int i = shopcarMapper.addShopcar(shopcar);
                System.out.println("数据库没有数据时添加成功"+i);
                k=i;
            }
        }else{
            if(shopcar1.getCount()==1&&change==-1){
                int i = shopcarMapper.deleteShopcar(shopcar.getFoodID(), shopcar.getUserID());
                System.out.println("当前count为1，并要减去，就可以删掉"+i);
                k=i;
            }else{
                int i = shopcarMapper.updateCount(shopcar1.getFoodID(), shopcar1.getUserID(), change);
                System.out.println("正常修改"+i);
                k=i;
            }
        }
        return k;
    }

    @Override
    public int deleteShopcarById(int id) {
        int i = shopcarMapper.deleteShopcarById(id);
        return i;
    }

}
