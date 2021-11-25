package com.takeout.dao;

import com.takeout.pojo.User;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface userMapper {
//   添加用户
    public int addUser(User user);
//    删除用户
    public int deleteUserById(int id);
//    修改用户信息
    public int updateUser(User user);
//   根据id查找用户
    public User selectUser(int id);
//  登录
    public User login(User user);
}
