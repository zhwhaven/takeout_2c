package com.takeout.service;

import com.takeout.pojo.Carson;

import java.util.List;

public interface confirmService {
    public List<Carson> selectAll(List<Integer> list,int userid);

}
