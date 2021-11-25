package com.takeout.pojo;

import java.util.List;

public class Carson {
    private Business business;
   private List<Cargrandson> cargrandsonList;
   private Receive receive;
   private User user;
   private String finish_time;//预计到达时间
   private int status;//状态
   private double totalPrice;//总价
    private int pageid;
    private int coutlist;//计算订单条数

    public int getCoutlist() {
        return coutlist;
    }

    public void setCoutlist(int coutlist) {
        this.coutlist = coutlist;
    }
    public void changecoutlist(){
        this.coutlist = cargrandsonList.size();
    }
    public void changeTotalPrice(){
        double total=0;
        for (Cargrandson cargrandson : cargrandsonList) {
            total+=cargrandson.getFood().getFoodPrice()*cargrandson.getCount();
        }
        this.totalPrice=total;
    }

    public Business getBusiness() {
        return business;
    }

    public void setBusiness(Business business) {
        this.business = business;
    }

    public List<Cargrandson> getCargrandsonList() {
        return cargrandsonList;
    }

    public void setCargrandsonList(List<Cargrandson> cargrandsonList) {
        this.cargrandsonList = cargrandsonList;
    }

    public Receive getReceive() {
        return receive;
    }

    public void setReceive(Receive receive) {
        this.receive = receive;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getFinish_time() {
        return finish_time;
    }

    public void setFinish_time(String finish_time) {
        this.finish_time = finish_time;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public int getPageid() {
        return pageid;
    }

    public void setPageid(int pageid) {
        this.pageid = pageid;
    }

    public Carson() {
        super();
    }

    public Carson(Business business, List<Cargrandson> cargrandsonList, Receive receive, User user, String finish_time, int status, double totalPrice, int pageid, int coutlist) {
        this.business = business;
        this.cargrandsonList = cargrandsonList;
        this.receive = receive;
        this.user = user;
        this.finish_time = finish_time;
        this.status = status;
        this.totalPrice = totalPrice;
        this.pageid = pageid;
        this.coutlist = coutlist;
    }

    @Override
    public String toString() {
        return "Carson{" +
                "business=" + business +
                ", cargrandsonList=" + cargrandsonList +
                ", receive=" + receive +
                ", user=" + user +
                ", finish_time='" + finish_time + '\'' +
                ", status=" + status +
                ", totalPrice=" + totalPrice +
                ", pageid=" + pageid +
                ", coutlist=" + coutlist +
                '}';
    }
}
