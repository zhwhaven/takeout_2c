package com.takeout.service.impl;

import com.takeout.dao.*;
import com.takeout.pojo.*;
import com.takeout.service.orderService;
import com.takeout.util.TimeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;

@Service
public class orderServiceImpl implements orderService {

    @Autowired
    private orderMapper orderMapper;
    @Autowired
    private foodMapper foodMapper;
    @Autowired
    private shopcarMapper shopcarMapper;
    @Autowired
    private com.takeout.dao.pageMapper pageMapper;
    @Autowired
    private page_orderMapper pageOrderMapper;
    @Autowired
    private businessMapper businessMapper;
    @Autowired
    private receive_mMapper receive_mMapper;
    @Autowired
    private userMapper userMapper;

    @Override
    public int submitConfirm(int userid,int receiveid, int[] shopcaridList, int[] foodidList,
                             int[] foodcountList, int[] bsidlist, int[] setlist,int[] bdlist) {

        List<String>  set_time=new ArrayList<String>();
        List<Order> orderList=new ArrayList<Order>();
        List<Integer> shopcar=new ArrayList<Integer>();
//        获得预计到达时间
        for(int i=0;i<setlist.length;i++){
            String finishTime = TimeUtils.getFinishTime(setlist[i]);
            set_time.add(finishTime);
            shopcar.add(shopcaridList[i]);
        }
//        将数据封装到Order
        System.out.println("11111");
        for(int i=0;i<setlist.length;i++){
            Order order=new Order();
            order.setShopcarID(shopcaridList[i]);
            order.setFoodID(foodidList[i]);
            order.setCount(foodcountList[i]);
            order.setUserID(userid);
            order.setBsID(bsidlist[i]);
            order.setReceiveID(receiveid);
            order.setFinish_time(set_time.get(i));
            order.setStatus(0);
            orderList.add(order);
        }
        System.out.println("2222");
        System.out.println(orderList);
// 先将数据存入到page表中
//  再将数据插入到order
//        在建立二者之间的连接
//        根据商家id先操作
//        bdlist是未重复，bsidlist有重复
        int aa=0;//记录order进行的下标
       for(int a=0;a<bdlist.length;a++){
           Page page=new Page();
           page.setBsid(bdlist[a]);
           page.setReceiveid(receiveid);
           page.setFinishtime(set_time.get(a));
           page.setUserid(userid);
           page.setStatus(0);
//           将数据插入到page中并获得pageid
           int i = pageMapper.addPage(page);
           int pageId = page.getId();
//           进行bsid匹配
           for (Order order : orderList) {
               if(order.getBsID()==bdlist[a]){
                   int i1 = orderMapper.addOrder(order);
                   int orderId = order.getId();
                   int i2 = pageOrderMapper.addPageAndOrder(pageId, orderId);
                   System.out.println("建立联系page成功");
               }
           }

       }

//
//        for (Order order : orderList) {
//
//        }
//        int i = orderMapper.submitConfirm(orderList);
//        System.out.println("数据插入到order"+i);
//   修改food的数量
        int gg=1;
        for(int k=0;k<foodcountList.length;k++){
            int i1 = foodMapper.updateFoodCount(foodidList[k], foodcountList[k]);
            if(i1!=1){gg=0;}
        }
        if(gg==0){
            System.out.println("修改出错");
        }
//删除shopcar中的数据
        int i1 = shopcarMapper.deleteShopcarList(shopcar);
        return i1;
    }

    @Override
    public List<Carson> selectAllOrdersByUser(int userid) {
//        查出订单中包含的店铺
                  List<Carson> carsonList=new ArrayList<Carson>();
        List<Page> pageList = pageMapper.selectPageByUserId(userid);
        for (Page page : pageList) {
            Carson carson=new Carson();
            int bsid = page.getBsid();
            int receiveid = page.getReceiveid();
            Business business = businessMapper.selectById(bsid);
            Receive receive = receive_mMapper.selectAddress(receiveid);
            List<Cargrandson> cargrandsonList = pageOrderMapper.selectByPageId(page.getId());
            carson.setCargrandsonList(cargrandsonList);
            carson.setBusiness(business);
            carson.setReceive(receive);
            carson.setPageid(page.getId());
            carson.setFinish_time(page.getFinishtime());
            carson.setStatus(page.getStatus());
            carson.changeTotalPrice();
            carson.changecoutlist();
            carsonList.add(carson);
        }
        return carsonList;
    }

    @Override
    public List<Carson> selectAllOrdersByBsid(int bsid) {
        //        查出订单中包含的买家
        List<Carson> carsonList=new ArrayList<Carson>();
        List<Page> pageList = pageMapper.selectPageByBusinessId(bsid);
        for (Page page : pageList) {
            Carson carson=new Carson();
            int userid = page.getUserid();

            int receiveid = page.getReceiveid();
            User user = userMapper.selectUser(userid);
            Receive receive = receive_mMapper.selectAddress(receiveid);
            List<Cargrandson> cargrandsonList = pageOrderMapper.selectByPageId(page.getId());
            carson.setCargrandsonList(cargrandsonList);
            carson.setUser(user);
            carson.setReceive(receive);
            carson.setPageid(page.getId());
            carson.setFinish_time(page.getFinishtime());
            carson.setStatus(page.getStatus());
            carson.changeTotalPrice();
            carson.changecoutlist();
            carsonList.add(carson);
        }
        return carsonList;
    }

    @Override
    public int changeStatus(int pageid, int status) {

        int i=pageMapper.updateStatus(pageid,status);
        return i;
    }
}
