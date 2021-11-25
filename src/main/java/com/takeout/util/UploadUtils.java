package com.takeout.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

public class UploadUtils {

    //    给文件一个独特的命名，防止覆盖
    public static String newFileName(String fileName){
        String newFile = UUID.randomUUID().toString().replaceAll("-", "") +"_" + fileName;
        return newFile;
    }
//    用哈希算法打散目录，并返回新的路径
    public static String newFilePath(String basepath,String filename){
        int hashCode = filename.hashCode();
//        二级目录
        int second = hashCode & 15;
//        三级目录
        int third = (hashCode >> 4) & 15;
        String rePath=basepath+File.separator+second+File.separator+third;
        String newPath=rePath.replace("\\","/");
        System.out.println(newPath);
        File file=new File(newPath);
        if(!file.exists()){
            file.mkdirs();
        }
        return newPath;
    }
//    key为源文件名 ，value为看到的文件名
   public static void getFileList(File file,HashMap<String,String> filename){
       File[] files = file.listFiles();
       if(files!=null){
           for (File file1 : files) {
               if(file1.isDirectory()){
                   getFileList(file1,filename);
               }else{
                   String file1Name = file1.getName();
                   int index = file1Name.indexOf("_");
                   String realName = file1Name.substring(index + 1);
                   System.out.println(file1Name);
                   filename.put(file1Name,realName);
               }
           }
       }
   }
    //   判断文件类型是否符合
    public static Boolean fitFileStyle(String FileName){
//                判断文件类型
        List<String> filestyle=new ArrayList<String>();
        filestyle.add("png");
        filestyle.add("jpg");
        filestyle.add("bmp");
        filestyle.add("titf");
        filestyle.add("tca");
        filestyle.add("webp");
        filestyle.add("tiff");
        filestyle.add("jpeg");
        String extName = FileName.substring(FileName.lastIndexOf("."));
        if(!filestyle.contains(extName)){
            return true;
        }
        else {return false;}
    }
//    传入文件名和路径，得到展示的真实路径名
    public static String getRealName(String path,String fileName){
        String substring = path.substring(44);

        return null;
    }

//    存放文件
public static void inputStreamToFile(InputStream ins, File file) {
    try {
        OutputStream os = new FileOutputStream(file);
        int bytesRead = 0;
        byte[] buffer = new byte[8192];
        while ((bytesRead = ins.read(buffer, 0, 8192)) != -1) {
            os.write(buffer, 0, bytesRead);
        }
        os.close();
        ins.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
    }
}
