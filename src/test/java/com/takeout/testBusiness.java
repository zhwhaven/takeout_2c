package com.takeout;

import com.takeout.dao.businessMapper;
import com.takeout.pojo.Business;
import com.takeout.service.businessService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class testBusiness {
    @Autowired
    private businessMapper mapper;
    @Autowired
    private com.takeout.service.businessService businessService;
    @Test
    public void t1(){
        Business business=new Business();
        business.setBs_account("3");
        business.setBs_password("3");
        business.setBs_name("3");
        business.setStore_name("3");
        business.setStore_address("3");
        business.setBs_phone("3");
        business.setIdCard_picture("3");
        business.setLicense_picture("3");
        business.setStart_time(28800);
        business.setOver_time(58880);
//        business.setSet_time(1800);
        business.setStore_picture("3");
        business.setStore_description("3");
        int i = mapper.addBusiness(business);
        System.out.println(i);
    }
//    @Test
//    public void t2(){
//        Business business=new Business();
//        business.setId(1);
//        business.setStatus(1);
//        mapper.dealBusiness(business);
//    }
    @Test
    public void t3(){
        Business business=new Business();
        business.setBs_account("1111888856");
        business.setBs_password("666666777");
        business.setBs_name("havenZen85g");
        business.setStore_name("汉堡店test555");
        business.setStore_address("广东江门");
        business.setBs_phone("1558026308599");
        business.setIdCard_picture("idpicture");
        business.setLicense_picture("license_picture");
        business.setStart_time(55555);
        business.setOver_time(88888);
        business.setSet_time(1800);
        business.setStore_picture("lllll");
        business.setStore_description("good taste");
        business.setId(8);
        int i = mapper.updateBusiness(business);
        System.out.println(i);
    }
    @Test
    public void t4(){
        int i = mapper.selectStatusByPhone("13580263088");
        System.out.println(i);
    }
    @Test
    public void t5(){
        Business business=new Business();
        business.setBs_account("1580268855");
        business.setBs_password("85454658");
        Business business1 = mapper.bsLogin(business);
        System.out.println(business1);
    }
    @Test
    public void t6(){
        List<Business> businessList = mapper.selectStoreByAddress("江门");
        for (Business business : businessList) {
            System.out.println(business);
        }
    }
    @Test
    public void t7(){
        Business business=new Business();
        business.setBs_name("hlingke");
        business.setBs_phone("58676444");
        business.setStore_name("55555");
        business.setLicense_picture("idpi");
        business.setIdCard_picture("lidsf");
        business.setStore_address("8888");
        business.setBs_account("586932147");
        business.setBs_password("85692174");
        business.setStart_time(85333);
        business.setOver_time(585555);
        business.setStore_picture("44444");
        business.setStore_description("99999");
        business.setStore_description("88888");
        business.setSet_time(1212);
        int i = mapper.addBusiness(business);
        System.out.println(i);
    }
    @Test
    public void tt1(){
        List<Business> businessList = businessService.selectBussinessByAddress("广州");
        for (Business business : businessList) {
            System.out.println(business);
        }
    }
    @Test
    public void ttt1(){
        Business business = businessService.selectStatusA("13580263080");
        System.out.println(business);
    }
}
