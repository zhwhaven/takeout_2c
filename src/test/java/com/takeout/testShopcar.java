package com.takeout;
import com.takeout.dao.confirmMapper;
import com.takeout.dao.orderMapper;
import com.takeout.dao.shopcarMapper;
import com.takeout.pojo.*;
import com.takeout.service.shopcarService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.ArrayList;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class testShopcar {
    @Autowired
    private shopcarMapper shopcarMapper;
    @Autowired
    private shopcarService service;
    @Autowired
    private confirmMapper confirmMapper;
    @Autowired
    private orderMapper orderMapper;
    @Test
    public void t1(){
//        List<Cargrandson> cargrandsons = shopcarMapper.selectFoodAndCount(1);
//        System.out.println(cargrandsons);
    }
    @Test
    public void t2(){
        List<Cargrandson> cargrandsons = shopcarMapper.selectFoodAndCount(1, 1);
        System.out.println(cargrandsons);
    }
    @Test
    public void t3(){
        List<Carson> carsonList = service.selectShopcar(1);
        System.out.println(carsonList);
    }
    @Test
    public void t4(){
        List<Business> businesses = shopcarMapper.selectBusinessByUserid(1);
        System.out.println(businesses);
    }
    @Test
    public void t5(){
        Shopcar shopcar=new Shopcar();
//        shopcar.setBsID(1);
        shopcar.setUserID(2);
        shopcar.setFoodID(2);
        int i = service.updateCount(shopcar, -1);
        System.out.println(i);
    }
    @Test
    public void t6(){
        int i = service.deleteShopcar(1, 2);
        System.out.println(i);
    }
    @Test
    public void t7(){
        List<Integer> list=new ArrayList<Integer>();
        list.add(10);
        list.add(11);
        list.add(12);
        List<Shopcar> shopcars = shopcarMapper.selectAllShopcarByList(list);
        System.out.println(shopcars);
        int i = shopcarMapper.addShopcarToConfirm(shopcars);
        System.out.println(i);

    }
    @Test
    public void t8(){
        int i1 = confirmMapper.deleteAll();
        System.out.println(i1);
    }
@Test
    public void t9(){
        List<Order> orderList=new ArrayList<Order>();
        Order order=new Order();
        order.setStatus(10);
        order.setFinish_time("0");
        order.setReceiveID(10);
        order.setBsID(1);
        order.setShopcarID(2);
        orderList.add(order);
    int i = orderMapper.submitConfirm(orderList);
    System.out.println(i);


}
}
