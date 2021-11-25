package com.takeout.service.impl;

import com.takeout.dao.businessMapper;
import com.takeout.dao.receive_mMapper;
import com.takeout.dao.userMapper;
import com.takeout.dao.user_receiveMapper;
import com.takeout.pojo.Business;
import com.takeout.pojo.Receive;
import com.takeout.pojo.User;
import com.takeout.service.userService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalTime;
import java.util.List;

@Service
public class userServiceImpl implements userService {
    @Autowired
    private userMapper userMapper;
    @Autowired
    private businessMapper businessMapper;
    @Autowired
    private user_receiveMapper user_receiveMapper;
    @Autowired
    private receive_mMapper receive_mMapper;
    @Override
//    用户注册
    public int addUser(User user) {
        int i = userMapper.addUser(user);
        return i;
    }

    @Override
//    用户删除
    public int deleteUserById(int id) {
        int i = userMapper.deleteUserById(id);
        return i;
    }

    @Override
//    修改用户信息
    public int updateUser(User user) {
        int i = userMapper.updateUser(user);
        return i;
    }

    @Override
//    查询用户信息
    public User selectUser(int id) {
        User user = userMapper.selectUser(id);
        return user;
    }

    @Override
    public User login(User user) {
        User login = userMapper.login(user);
        return login;
    }

    @Override
    public List<Receive> selectAllAddress(int id) {
        List<Receive> receiveList = user_receiveMapper.selectAllAddressList(id);
        return receiveList;
    }

    @Override
    public int addAddress(int uid, Receive receive) {
        int i = receive_mMapper.addAddress(receive);
        int i1 = user_receiveMapper.addUserReceive(uid, receive.getId());
        return i1;
    }

    @Override
    public int deleteAddress(int receiveid) {
        int i = receive_mMapper.deleteAddress(receiveid);
        return i;
    }

//    @Override
//    public List<Business> selectBussinessByAddress(String address) {
////        获得当前时间
//        LocalTime localTime = LocalTime.now();
//        long nowTime = localTime.toSecondOfDay();
//       List<Business> businessList= businessMapper.selectBusinessByAddressAndTime(nowTime,address);
//        return businessList;
//    }
}
