package com.takeout.dao;

import com.takeout.pojo.Comment;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface commentMapper {
    //插入评论并得到评论的编号
    public int addComment(Comment comment);
    //插入评论的编号和订单id
    public int addCidAndPageid(@Param("c_id")int c_id,@Param("page_id")int page_id);
    //插入评论的编号和商品的编号
    public int addCidAndFoodid(@Param("foodidlist") List<Integer> foodid,@Param("c_id") int c_id);
    //根据pageid删除评论
    public int deleteByPageId(int pageid);
    //根据商品id查看评论
    public List<Comment> selectByFoodId(int foodid);

}
