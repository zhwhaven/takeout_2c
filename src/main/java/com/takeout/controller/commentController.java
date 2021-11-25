package com.takeout.controller;

import com.takeout.pojo.Comment;
import com.takeout.pojo.Food;
import com.takeout.pojo.User;
import com.takeout.service.businessService;
import com.takeout.service.commentService;
import com.takeout.service.orderService;
import com.takeout.util.UploadUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
@Controller
@RequestMapping("/comment")
public class commentController {
    @Autowired
    commentService commentService;
    @Autowired
    com.takeout.service.orderService orderService;
    @Autowired
    com.takeout.service.businessService businessService;

//    跳转到评论界面
@RequestMapping("/intoComment")
public String intoComment(int []foodid ,String[]foodName,String bs_name,Integer page_id,HttpServletRequest request){
    System.out.println("pageid++++"+page_id);
    List<Food> foodList=new ArrayList<Food>();
    System.out.println("foodid = " + foodid);
    System.out.println("foodName = " + foodName);
    for (int i = 0; i < foodid.length; i++) {
        Food food=new Food();
        food.setId(foodid[i]);
        food.setFoodName(foodName[i]);
        foodList.add(food);
    }
    System.out.println(foodList);
    request.setAttribute("page_id",page_id);
    request.setAttribute("bs_name",bs_name);
    request.setAttribute("foodList",foodList);
    return "evaluation";
}
// 接受评论并保存
    @RequestMapping(value = "/saveComment",method = RequestMethod.POST)
    public String saveComment(MultipartFile multipartFile, HttpSession session,Comment comment,int []foodidlist) throws IOException {

    User user = (User) session.getAttribute("userlogin");
        System.out.println(user);
         comment.setUser(user);
        List<Integer> food=new ArrayList<Integer>();
        for (int i : foodidlist) {
            food.add(i);
        }
        System.out.println("保存评论");
        System.out.println("000000"+foodidlist);
        //        获得路径
        String classpath = this.getClass().getResource("/").getPath().replaceFirst("/", "");
        String str=classpath.substring(0, classpath.indexOf("target"));
        //target下的路径
        String targetRoot = classpath.replaceAll("WEB-INF/classes/", "commentupload/");
//       webapp下的路径
        String webappRoot=str+"src/main/webapp/commentupload/";
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
                comment.setC_picture(realName);
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

          int i=commentService.saveComment(comment,food);
        if (i<0){
            System.out.println("fail");
        }else {
            System.out.println("success");
            System.out.println("pageid===>"+comment.getPage_id());
            int i1 = orderService.changeStatus(comment.getPage_id(), 3);
            System.out.println("保存成功");
        }
        return "redirect:/order/intoOrder";
    }
//    查询评论
@RequestMapping("/selectCommentById")
    public String selectCommentById(int foodid, int bs_id,HttpServletRequest request,HttpSession session){
        List<Comment> commentList=commentService.selectCommentByFoodid(foodid);
        System.out.println(commentList);
         request.setAttribute("commentList",commentList);
    return "foodComments";
}
}
