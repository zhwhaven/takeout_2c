package com.takeout.service.impl;

import com.takeout.dao.bs_foodMapper;
import com.takeout.dao.businessMapper;
import com.takeout.pojo.Business;
import com.takeout.pojo.Food;
import com.takeout.service.businessService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalTime;
import java.util.List;

@Service
public class businessServiceImpl implements businessService {
     @Autowired
     businessMapper businessMapper;
     @Autowired
    bs_foodMapper bs_foodMapper;
    @Override
    public Business login(Business business) {
        Business business1 = businessMapper.bsLogin(business);
        return business1;
    }

    @Override
    public int register(Business business) {
        int i = businessMapper.addBusiness(business);
        return i;
    }

    @Override
    public List<Business> selectBussinessByAddress(String address) {
        //        获得当前时间
        LocalTime localTime = LocalTime.now();
        long nowTime = localTime.toSecondOfDay();
        List<Business> businessList= businessMapper.selectBusinessByAddressAndTime(nowTime,address);

        return businessList;
    }

    @Override
    public List<Food> showbs_food(int id) {
        List<Food> foodList = bs_foodMapper.selectAllFood(id);
        return foodList;
    }

    @Override
    public List<Business> selectAll() {
        List<Business> businessList=businessMapper.selectAll();
        return businessList;
    }

    @Override
    public int pass(int id) {
        int i=businessMapper.updateStatus(id);
        return i;
    }

    @Override
    public int deleteBusiness(int id) {
        int i = businessMapper.deleteBusiness(id);
        return i;
    }

    @Override
    public int selectStatus(String phone) {
        int i = businessMapper.selectStatusByPhone(phone);
        return i;
    }

    @Override
    public Business selectStatusA(String bs_phone) {
        Business business = businessMapper.selectStatus(bs_phone);
        return business;
    }

    @Override
    public List<Business> selectBussinessByKey(String address, String keyword) {
        List<Business> businessList= businessMapper.selectBusinessByKey(address,keyword);

        return businessList;

    }

}
