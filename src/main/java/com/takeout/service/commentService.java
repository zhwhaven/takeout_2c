package com.takeout.service;

import com.takeout.pojo.Comment;

import java.util.List;

public interface commentService {
    int saveComment(Comment comment, List<Integer> food);

    List<Comment> selectCommentByFoodid(int foodid);
}
