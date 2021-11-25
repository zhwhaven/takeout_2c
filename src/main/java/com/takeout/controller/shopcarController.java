package com.takeout.controller;

import com.takeout.pojo.Carson;
import com.takeout.pojo.Receive;
import com.takeout.pojo.Shopcar;
import com.takeout.pojo.User;
import com.takeout.service.confirmService;
import com.takeout.service.shopcarService;
import com.takeout.service.userService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/shopcar")
public class shopcarController {
    @Autowired
    userService userService;
    @Autowired
    com.takeout.service.shopcarService shopcarService;
    @Autowired
    private confirmService confirmService;
    @RequestMapping(value = "/addupdateShopcar",method = RequestMethod.POST)
    @ResponseBody
//    'foodID':foodid,'bsID':bsid,'change':1
    public void addupdateShopcar(@RequestBody Shopcar shopcar ,HttpSession session){
        System.out.println(shopcar);
        User userlogin = (User) session.getAttribute("userlogin");
        shopcar.setUserID(userlogin.getId());
        System.out.println(shopcar);
        int i = shopcarService.updateCount(shopcar, 1);
        System.out.println(i+"修改购物车");

    }
    @RequestMapping(value = "/cutupdateShopcar",method = RequestMethod.POST)
    @ResponseBody
//    'foodID':foodid,'bsID':bsid,'change':1
    public void cutupdateShopcar(@RequestBody Shopcar shopcar ,HttpSession session){
        System.out.println(shopcar);
        User userlogin = (User) session.getAttribute("userlogin");
        shopcar.setUserID(userlogin.getId());
        System.out.println(shopcar);
        int i = shopcarService.updateCount(shopcar, -1);
        System.out.println(i+"修改购物车");
    }
     @RequestMapping(value = "/intoShopcar")
    public String intoShopcar(HttpServletRequest request,HttpSession session){
         User userlogin = (User) session.getAttribute("userlogin");
         System.out.println(userlogin);
         List<Carson> carsonList = shopcarService.selectShopcar(userlogin.getId());
         request.setAttribute("carsonList",carsonList);
         System.out.println(carsonList);
         return "shopcar";
     }
//      删除购物车
    @RequestMapping(value = "/deleteShopcar",method = RequestMethod.POST)
    @ResponseBody
    public void deleteShopcar(@RequestBody Shopcar shopcar){
        System.out.println(shopcar.getId());
        int i = shopcarService.deleteShopcarById(shopcar.getId());
        System.out.println("删除购物车"+i);
    }
//    购物车结算
    @RequestMapping(value = "/countShopcar")
    public String countShopcar(int[] shopcaridlist,int allcount,float allprice,HttpSession session,HttpServletRequest request){
        System.out.println("allcount="+allcount+"allprice="+allprice);
        List<Integer> idlist=new ArrayList<Integer>();
        for (int i : shopcaridlist) {
            System.out.println(i);
         idlist.add(i);
        }
        System.out.println("传入选中的购物车id集合"+idlist);
        if(shopcaridlist[0]==0){

        }else{
            User userlogin = (User) session.getAttribute("userlogin");
            List<Carson> carsonList = confirmService.selectAll(idlist, userlogin.getId());
            System.out.println(carsonList);

            List<Receive> receiveList = userService.selectAllAddress(userlogin.getId());
            System.out.println(receiveList);
            request.setAttribute("receiveList",receiveList);
            request.setAttribute("carson",carsonList);
            request.setAttribute("allcount",allcount);
            request.setAttribute("allprice",allprice);
        }

        return "confirm";
    }

}
