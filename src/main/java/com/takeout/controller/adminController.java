package com.takeout.controller;

import com.takeout.pojo.Admin;
import com.takeout.pojo.Business;
import com.takeout.service.adminService;
import com.takeout.service.businessService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class adminController {
//    管理员登录，成功则跳转页面
    @Autowired
   private adminService adminService;
    @Autowired
    private businessService businessService;
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public String admin_login(String admin_account, String admin_password, HttpServletRequest req
                                    , HttpServletResponse response) throws IOException {
        Admin i=adminService.login( admin_account, admin_password);
        if(i!=null){
            return "adminManagement";

        }else{
//            response.getWriter().print("密码有误");
            String msg="密码有误";
            req.setAttribute("msg",msg);
            return "adminLogin";
        }
    }
//    进入管理商家界面
    @RequestMapping(value = "/intoBusinessTable")
    public String intoBusinessTable(HttpServletRequest request){
        List<Business> businessList=businessService.selectAll();
        request.setAttribute("businessList",businessList);
        return "businessTable";
    }
//    对商家进行批准
    @RequestMapping(value = "/pass",method = RequestMethod.POST)
    @ResponseBody
    public String pass(@RequestBody Business business){
        int i=businessService.pass(business.getId());
        if(i==1){
            return "批准操作成功";
        }
        else{
            return "批准操作失败";
        }
    }
//    删除商家
@RequestMapping(value = "/deleteBusiness", method = RequestMethod.POST)
@ResponseBody
public String deleteBusiness(@RequestBody Business business) {
    int i = businessService.deleteBusiness(business.getId());
    if (i == 1) {
        return "删除成功";
    } else {
        return "删除失败";
    }
}

}
