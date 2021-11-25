package com.takeout;

import com.takeout.dao.pageMapper;
import com.takeout.dao.page_orderMapper;
import com.takeout.pojo.Cargrandson;
import com.takeout.pojo.Page;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class testPage {
    @Autowired
    private pageMapper pageMapper;
    @Autowired
    private page_orderMapper pageOrderMapper;
    @Test
    public void t1(){
        List<Page> pages = pageMapper.selectPageByUserId(3);
        System.out.println(pages);
        List<Page> pages1 = pageMapper.selectPageByBusinessId(19);
        System.out.println(pages1);
    }
    @Test
    public void t2(){
        List<Cargrandson> cargrandsonList = pageOrderMapper.selectByPageId(2);
        for (Cargrandson cargrandson : cargrandsonList) {
            System.out.println(cargrandson);
        }
    }
}
