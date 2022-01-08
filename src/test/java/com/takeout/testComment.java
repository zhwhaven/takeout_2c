package com.takeout;

import com.takeout.dao.commentMapper;
import com.takeout.pojo.Comment;
import com.takeout.pojo.User;
import com.takeout.util.TimeUtils;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class testComment {
  @Autowired
    commentMapper mapper;
  @Test
    public void t1(){
      Comment x=new Comment();
      User user=new User();
      user.setId(15);
      x.setC_time(TimeUtils.getNowTime());
      x.setC_picture("sdfsd");
      x.setC_score(5);
      x.setC_word("85");
      x.setUser(user);
      mapper.addComment(x);
      System.out.println(x.getC_id());
  }
  @Test
  public void t2(){
    int i = mapper.addCidAndPageid(7, 18);
    System.out.println(i);
  }
  @Test
  public void t3(){
//    List<Integer> foodlist=new ArrayList<Integer>();
//    foodlist.add(15);
//    foodlist.add(16);
//    foodlist.add(17);
//    int i = mapper.addCidAndFoodid(foodlist, 7);
//    System.out.println(i);
  }
  @Test
  public void t4(){
    int id=10;
    List<Comment> comments = mapper.selectByFoodId(23);
    List<Comment> comment1 = mapper.selectByFoodId(23);
    System.out.println(comments);
    System.out.println(comment1);
  }

}
