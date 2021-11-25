package com.takeout.service;

import com.takeout.pojo.Admin;

public interface adminService {
    public Admin login(String admin_account, String admin_password);
}
