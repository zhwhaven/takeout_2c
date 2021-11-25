package com.takeout.service;

import com.takeout.pojo.Business;
import com.takeout.pojo.Receive;
import com.takeout.pojo.User;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface userService {
    public int addUser(User user);
    public int deleteUserById(int id);
    public int updateUser(User user);
    public User selectUser(int id);
   public User login(User user);
   public List<Receive> selectAllAddress(int id);
   public int addAddress(int uid,Receive receive);
   public int deleteAddress(int receiveid);
//    List<Business> selectBussinessByAddress(String address);
}
