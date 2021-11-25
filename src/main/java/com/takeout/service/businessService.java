package com.takeout.service;

import com.takeout.pojo.Business;
import com.takeout.pojo.Food;

import java.util.List;

public interface businessService {
    Business login(Business business);

    int register(Business business);

    List<Business> selectBussinessByAddress(String address);

    List<Food> showbs_food(int id);

    List<Business> selectAll();

    int pass(int id);

    int deleteBusiness(int id);

    int selectStatus(String phone);

    Business selectStatusA(String bs_phone);

    List<Business> selectBussinessByKey(String address, String keyword);
}
