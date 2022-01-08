package com.takeout.controller;

import com.alibaba.fastjson.JSON;
import com.takeout.pojo.Business;
import com.takeout.pojo.Receive;
import com.takeout.pojo.User;
import com.takeout.service.userService;
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
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/user")
public class userController {
    @Autowired
    private com.takeout.service.userService userService;
    @RequestMapping("/code")
    public void code(String code,HttpSession session){
       String session_key = (String) session.getAttribute("KAPTCHA_SESSION_KEY");
       if(code.equals(session_key)){
           System.out.println("kkkk");
       }
    }
    @RequestMapping("/login")
    public ModelAndView login(User user, HttpSession session,ModelAndView modelAndView,String code){
        String session_key = (String) session.getAttribute("KAPTCHA_SESSION_KEY");
        if(code.equals(session_key)){
            System.out.println("kkkk");
        }


        System.out.println(user);
       User user1= userService.login(user);
        System.out.println(user1);
       if(user1==null){
           modelAndView.addObject("msg","密码错误");
           modelAndView.setViewName("userLogin");

       }else{
           session.setAttribute("userlogin",user1);
           modelAndView.setViewName("index");
       }
        return modelAndView;
    }
    @RequestMapping("/register")
    public ModelAndView register(User user,ModelAndView modelAndView,HttpServletResponse response) throws IOException {
        int i = userService.addUser(user);
        response.setHeader("Content-type", "text/html;charset=UTF-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        if(i==0){
          modelAndView.setViewName("userRegister");
        }else{
            response.getWriter().print("注册成功，欢迎登录");
            modelAndView.setViewName("userLogin");
        }
        return modelAndView;
    }
    @RequestMapping("/out")
    public String out(HttpSession session){
        session.removeAttribute("userlogin");
        return "userLogin";
    }
    @RequestMapping("/intoAddress")
    public String intoAddress(HttpSession session,HttpServletRequest request){
        User userlogin = (User) session.getAttribute("userlogin");
        List<Receive> receiveList = userService.selectAllAddress(userlogin.getId());
        System.out.println(receiveList);
        request.setAttribute("receiveList",receiveList);
        return "address";
    }
    @RequestMapping(value = "/addAddress",method = RequestMethod.POST)
    public @ResponseBody int addAddress(@RequestBody Receive receive, HttpSession session, HttpServletResponse resp){
       int s=0;
        System.out.println(receive);
        User userlogin = (User) session.getAttribute("userlogin");
        int i = userService.addAddress(userlogin.getId(), receive);
        if(i==1){
            s=1;
        }
        else {
            s=0;
        }
        return s;
    }
    @RequestMapping(value = "/deleteAddress",method = RequestMethod.POST)
    public @ResponseBody int deleteAddress(@RequestBody Receive receive){
        int receiveId = receive.getId();
        int i = userService.deleteAddress(receiveId);
        return i;
    }
    @RequestMapping("/a1")
    public String t1(HttpServletRequest request, HttpServletResponse response) throws IOException {
        User user = userService.selectUser(3);
        request.setAttribute("user",user);
//       String country     =   request.getHeader("X-AppEngine-Country");
//       String region      =   request.getHeader("X-AppEngine-Region");
//       String city        =   request.getHeader("X-AppEngine-City");
//       String temp        =   request.getHeader("X-AppEngine-CityLatLong");
////       response.getWriter().println(city);
//        System.out.println(country+ "-" +region+"-"+city+"-"+temp);
        return "test";
    }
    //    文件上传操作
    @RequestMapping(value = "/a2",method = RequestMethod.POST)
    @ResponseBody
    public void t2(MultipartFile[] multipartFiles,HttpServletRequest request, HttpServletResponse response) throws IOException {
//        System.out.println(name);
        System.out.println("ffff");
        String path1=request.getContextPath();
        System.out.println(path1);
        String path = request.getServletContext().getRealPath("/upload/");
        System.out.println(path);
        File file=new File(path);
        if(!file.exists()){
            file.mkdirs();
        }
        System.out.println("ddd");
        for (MultipartFile multipartFile : multipartFiles) {
            String originalFilename = multipartFile.getOriginalFilename();
            if( originalFilename==null){
                System.out.println("ggg");
                String tname = multipartFile.getName();
                System.out.println(tname);

            }else {
                System.out.println("jjjj");
                if(UploadUtils.fitFileStyle(originalFilename)==true){
                    System.out.println("kkkk");
                    String filename = multipartFile.getOriginalFilename();
                    String newFileName = UploadUtils.newFileName(filename);
                    System.out.println(newFileName);
                    String newFilePath = UploadUtils.newFilePath(path, filename);
                    System.out.println(newFilePath);
                    System.out.println(newFileName);
//                    String substring = newFilePath.substring(44);
//                    System.out.println("截断后"+substring+"\\");
//                    String stu=substring+"\\";
//                    String last=stu+newFileName;
                    String last = UploadUtils.getRealName(newFilePath, newFileName);
                    System.out.println(last);
                    multipartFile.transferTo(new File(newFilePath + File.separator + newFileName));
                    //文件的路径名加文件名
                    String xt= newFilePath + File.separator + newFileName;
                    System.out.println(xt);
                }

                else {
                    System.out.println("22222");
                    response.getWriter().println("传入的图片类型有误，或非图片！！！");
                }
            }
        }
    }
    @RequestMapping("/a3")
    public void t4(URL url){
        System.out.println(url.toString());
    }
    @RequestMapping("/a4")
    public ModelAndView t5(ModelAndView modelAndView, String receive){
        System.out.println(receive);
        Receive receive1 = JSON.parseObject(receive, Receive.class);
        Receive receive2=new Receive(2,"lingnling","1580263089","不知名之地");
        List<Receive> receiveList=new ArrayList<Receive>();
        receiveList.add(receive1);
        receiveList.add(receive2);
        modelAndView.setViewName("testList");
        modelAndView.addObject("receiveList",receiveList);
        System.out.println(receive1);
        return modelAndView;
    }
    @RequestMapping("/a6")
    @ResponseBody
    public void t6(String receiveList){
        System.out.println(receiveList);
    }
    @RequestMapping(value = "/a7",method = RequestMethod.POST)
    @ResponseBody
    public void t7(@RequestBody List<Receive> receiveList){
        System.out.println("555555");
        System.out.println(receiveList);
    }
    @RequestMapping(value = "/a9",method = RequestMethod.POST)
    public String t8(HttpServletResponse response) throws IOException {
        System.out.println("555555");
        response.getWriter().print("dsjfksdjfkj");
        return "testList";
    }
    @RequestMapping(value = "/a10",method = RequestMethod.POST)
    @ResponseBody
    public void t10(HttpServletRequest request,MultipartFile multipartFile,int []hobby,User user) throws IOException {
        System.out.println("user -- println");
        System.out.println(user);
        System.out.println("爱好打印");
        for (int i : hobby) {
            System.out.println(i);
        }
        String classpath = this.getClass().getResource("/").getPath().replaceFirst("/", "");
        String str=classpath.substring(0, classpath.indexOf("target"));
        //target下的路径
        String webappRoot = classpath.replaceAll("WEB-INF/classes/", "upload/");
//       webapp下的路径
        String last=str+"src/main/webapp/upload/";
        System.out.println(last);
        String originalFilename = multipartFile.getOriginalFilename();
        multipartFile.transferTo(new File(webappRoot+originalFilename));
//        获得字节流 分别存入target 和 webapp下
        InputStream inputStream1 = multipartFile.getInputStream();
        InputStream inputStream2 = multipartFile.getInputStream();
         UploadUtils.inputStreamToFile(inputStream1,new File(webappRoot+originalFilename));
        UploadUtils.inputStreamToFile(inputStream2,new File(last+originalFilename));
    }
    @RequestMapping(value = "/a11")
    @ResponseBody
    public void tx(){
        String classpath = this.getClass().getResource("/").getPath().replaceFirst("/", "");
        String str=classpath.substring(0, classpath.indexOf("target"));
        String last=str+"src/main/webapp/upload/";
        System.out.println(classpath);
        System.out.println(str);
        System.out.println(last);
        //        String webappRoot = classpath.replaceAll("target", "src/main/webapp/upload");
        //        System.out.println(webappRoot);
    }

}
