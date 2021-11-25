package com.takeout.controller;

import com.takeout.pojo.Business;
import com.takeout.pojo.Carson;
import com.takeout.pojo.Page;
import com.takeout.pojo.User;
import com.takeout.service.orderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/order")
public class orderController {
    @Autowired
    private orderService orderService;
    @RequestMapping("/submitConfirm")
    public String submitConfirm(int receiveid, int[] shopcaridList, int[] foodidList,
                              int[] foodcountList, int[] bsidlist, int[] setlist,
                              int[] bdlist, HttpSession session){
        User userlogin = (User) session.getAttribute("userlogin");
        int i = orderService.submitConfirm(userlogin.getId(), receiveid, shopcaridList, foodidList, foodcountList, bsidlist, setlist,bdlist);
        return "redirect:/order/intoOrder";
    }
//    用户查看订单
    @RequestMapping("/intoOrder")
    public String selectOrder(HttpSession session, HttpServletRequest request){
        User userlogin = (User) session.getAttribute("userlogin");
        List<Carson> carsonList = orderService.selectAllOrdersByUser(userlogin.getId());

        request.setAttribute("carsonList",carsonList);
        return "orders";
    }
//    商家查看订单
    @RequestMapping("/bsSelectOrder")
    public String bsselectOrder(HttpSession session, HttpServletRequest request){
        Business bslogin = (Business) session.getAttribute("bslogin");
        List<Carson> carsonList = orderService.selectAllOrdersByBsid(bslogin.getId());
        request.setAttribute("carsonList",carsonList);
        return "bsOrderList";
    }
//    用户确认订单/商家发货
    @RequestMapping(value = "/changeStutus",method = RequestMethod.POST)
    @ResponseBody
    public void changeStatus(@RequestBody Page page){
        System.out.println(page.getId()+" "+page.getStatus());
              int pageid= page.getId();
              int status=page.getStatus();
              int i=orderService.changeStatus(pageid,status);
        System.out.println("修改订单状态"+i);
    }
}
