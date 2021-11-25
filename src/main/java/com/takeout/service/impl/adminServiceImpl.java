package com.takeout.service.impl;

import com.takeout.dao.adminMapper;
import com.takeout.pojo.Admin;
import com.takeout.service.adminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class adminServiceImpl implements adminService {
    @Autowired
    com.takeout.dao.adminMapper adminmapper;
//    登录
    @Override
    public Admin login(String admin_account, String admin_password) {
        Admin i = adminmapper.adminLogin(admin_account, admin_password);

        return i;
    }
}
