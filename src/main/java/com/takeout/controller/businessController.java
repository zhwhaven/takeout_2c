package com.takeout.controller;

import com.takeout.pojo.Business;
import com.takeout.pojo.Food;
import com.takeout.service.businessService;
import com.takeout.service.shopService;
import com.takeout.util.UploadUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

@Controller
@RequestMapping("/business")
public class businessController {
    @Autowired
    shopService shopService;
    @Autowired
    com.takeout.service.businessService businessService;
    @RequestMapping("/login")
    public String login(Business business, HttpServletRequest request, HttpSession session){
        System.out.println("11111");
        Business business1=businessService.login(business);
        if(business1==null){
            request.setAttribute("msg","密码错误");
            return "businessLogin";
        }
        else{
            System.out.println(business1);
            session.setAttribute("bslogin",business1);
            return "businessManagement";
        }

    }
    @RequestMapping("/out")
    public String out(HttpSession session){
        session.removeAttribute("bslogin");
     return "businessLogin";
    }
//
    @RequestMapping(value = "/register",method = RequestMethod.POST)
    public String register(Business business,MultipartFile[] files,HttpServletRequest request) throws IOException {
        System.out.println(business);
        int i=0;
//        获得路径
        String classpath = this.getClass().getResource("/").getPath().replaceFirst("/", "");
        String str=classpath.substring(0, classpath.indexOf("target"));
        //target下的路径
        String targetRoot = classpath.replaceAll("WEB-INF/classes/", "upload/");
//       webapp下的路径
        String webappRoot=str+"src/main/webapp/upload/";
        File file2=new File(targetRoot);
        if(!file2.exists()){
            file2.mkdirs();
        }
        File file1=new File(webappRoot);
        if(!file1.exists()){
            file1.mkdirs();
        }

        for (MultipartFile fil : files) {
            i++;
//            获得文件名
            String filename = fil.getOriginalFilename();
            if(filename==null){

            }else {
//                判定文件类型是否符合
                if(UploadUtils.fitFileStyle(filename)==true){
//                获得新文件名
                String newFileName = UploadUtils.newFileName(filename);
//                获得新路径
                String newtargetRoot = UploadUtils.newFilePath(targetRoot, newFileName);
                String newwebappRoot = UploadUtils.newFilePath(webappRoot, newFileName);

                //获得新路径加新名字
                    String x1=newtargetRoot+"/"+newFileName;
                    String x2=newwebappRoot +"/"+newFileName;
//                获得存入数据库的路径和文件名
                    String[] s=x2.split("webapp/");
                    String realName= s[s.length-1];
//                    String realName = UploadUtils.getRealName(newFilePath, newFileName);
                if(i==1){
                    business.setStore_picture(realName);
                }
                else if(i==2){
                    business.setLicense_picture(realName);
                }else{
                    business.setIdCard_picture(realName);
                }
//                存入文件
//                    将文件存入target
                    InputStream inputStream1 = fil.getInputStream();
                    InputStream inputStream2 = fil.getInputStream();
                   UploadUtils.inputStreamToFile(inputStream1,new File(x1));
                   UploadUtils.inputStreamToFile(inputStream2,new File(x2));
//                    fil.transferTo(new File(newFilePath+File.separator+newFileName));
            }else{
                    System.out.println("图片类型错误");
                }
        }
        }
            int k=  businessService.register(business);
             if(k==1){
                 return "businessLogin";
             } else{
                 return "businessRegister";
             }

    }
    //选择城市时的展示
    @RequestMapping(value = "/showbusiness")
    public String showbusiness(String address,HttpServletRequest request){
        System.out.println("555555");
        System.out.println(address);
        List<Business> businessList= businessService.selectBussinessByAddress(address);
        System.out.println(businessList);
        request.setAttribute("businessList",businessList);
        request.setAttribute("Address", address);
        return "index";
    }

    //搜索时展示
    @RequestMapping(value = "/showBsByKey")
    public String showbusiness(String address,String keyword,HttpServletRequest request){
        System.out.println(address);
        List<Business> businessList= businessService.selectBussinessByKey(address,keyword);
        System.out.println(businessList);
        request.setAttribute("businessList",businessList);
        request.setAttribute("Address", address);
        return "index";
    }
    @RequestMapping(value = "/showbs_food")
    public String showbs_food(Business business,HttpServletRequest request){
        List<Food> foodList=businessService.showbs_food(business.getId());
        System.out.println(foodList);
        request.setAttribute("business",business);
        request.setAttribute("foodList",foodList);
        return "store_details";
    }
//    上架商品
   @RequestMapping(value = "upload_food",method = RequestMethod.POST)
    public String uploadFood(int bs_id,MultipartFile multipartFile,Food food,HttpServletRequest request) throws IOException {

       //        获得路径
       String classpath = this.getClass().getResource("/").getPath().replaceFirst("/", "");
       String str=classpath.substring(0, classpath.indexOf("target"));
       //target下的路径
       String targetRoot = classpath.replaceAll("WEB-INF/classes/", "foodupload/");
//       webapp下的路径
       String webappRoot=str+"src/main/webapp/foodupload/";
       File file2=new File(targetRoot);
       if(!file2.exists()){
           file2.mkdirs();
       }
       File file1=new File(webappRoot);
       if(!file1.exists()){
           file1.mkdirs();
       }
       String filename = multipartFile.getOriginalFilename();
       if(filename==null){

       }else {
//                判定文件类型是否符合
           if(UploadUtils.fitFileStyle(filename)==true){
//                获得新文件名
               String newFileName = UploadUtils.newFileName(filename);
//                获得新路径
               String newtargetRoot = UploadUtils.newFilePath(targetRoot, newFileName);
               String newwebappRoot = UploadUtils.newFilePath(webappRoot, newFileName);

               //获得新路径加新名字
               String x1=newtargetRoot+"/"+newFileName;
               String x2=newwebappRoot +"/"+newFileName;
//                获得存入数据库的路径和文件名
               String[] s=x2.split("webapp/");
               String realName= s[s.length-1];
               food.setFoodPicture(realName);
//                    String realName = UploadUtils.getRealName(newFilePath, newFileName);

//                存入文件
//                    将文件存入target
               InputStream inputStream1 = multipartFile.getInputStream();
               InputStream inputStream2 = multipartFile.getInputStream();
               UploadUtils.inputStreamToFile(inputStream1,new File(x1));
               UploadUtils.inputStreamToFile(inputStream2,new File(x2));
//                    fil.transferTo(new File(newFilePath+File.separator+newFileName));
           }else{
               System.out.println("图片类型错误");
           }
       }

       int i = shopService.uploadFood(bs_id, food);
       String msg=null;
       if(i==1){
           msg="添加成功，欢迎继续添加";
       }
       else{
           msg="添加失败，欢迎继续添加";
       }
       request.setAttribute("msg",msg);
       return "food_upload";
   }
   @RequestMapping("/selectAllFood")
    public String selectAllFood(HttpSession session,HttpServletRequest request){
        Business bslogin = (Business) session.getAttribute("bslogin");
       int id = bslogin.getId();
       System.out.println("wwwwwwwwwwwwwwwwwwww");
       System.out.println(bslogin);
       List<Food> foodList=shopService.selectFoodByUid(id);
       System.out.println(foodList);
       request.setAttribute("foodList",foodList);
       return "updatefood";

   }
   @RequestMapping(value = "/updateFood",method =RequestMethod.POST)
    @ResponseBody
    public String updateFood(@RequestBody Food food){
       System.out.println(food);
       int i=shopService.updateFood(food);
       if(i==1){      return "修改成功";}
       else{
           return "修改失败";
       }

   }
    @RequestMapping(value = "/deleteFood",method =RequestMethod.POST)
    @ResponseBody
    public String deleteFood(@RequestBody Food food){
        System.out.println(food);
        int i=shopService.deleteFood(food.getId());
        if(i==1){      return "删除成功";}
        else{
            return "删除失败";
        }

    }
    @RequestMapping(value = "/seleteStatus",method =RequestMethod.POST)
    @ResponseBody
    public String seleteStatus(@RequestBody Business business){
        System.out.println(business.getBs_phone());
        Business bs= businessService.selectStatusA(business.getBs_phone());
        String s=null;
        if(bs!=null){
            if(bs.getStatus()==1){
                s="已加入";
            }else{
                s="审核中";
            }
        }else{
            s="未注册";
        }
        return s;
    }
}
