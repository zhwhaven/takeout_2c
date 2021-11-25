package com.takeout.service.impl;

import com.takeout.dao.commentMapper;
import com.takeout.pojo.Comment;
import com.takeout.service.commentService;
import com.takeout.util.TimeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class commentServiceImpl implements commentService {
    @Autowired
    com.takeout.dao.commentMapper commentMapper;

    @Override
    public int saveComment(Comment comment, List<Integer> food) {
//        插入评论返回评论编号
        comment.setC_time(TimeUtils.getNowTime());
        int c = commentMapper.addComment(comment);
        System.out.println("c = " + c);
        int c_id=comment.getC_id();
        System.out.println("c_id = " + c_id);

//        插入编号和pageid
        int i = commentMapper.addCidAndPageid(c_id, comment.getPage_id());
        System.out.println("i = " + i);
//        插入食物id和评论id
        int i1 = commentMapper.addCidAndFoodid(food, c_id);
        System.out.println("i1 = " + i1);
        return i1;
    }
//根据食品id查找
    @Override
    public List<Comment> selectCommentByFoodid(int foodid) {
        List<Comment> commentList = commentMapper.selectByFoodId(foodid);
        return commentList;
    }

}
