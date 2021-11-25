package com.takeout.pojo;


public class Order {
    private int id;
    private int shopcarID;
    private int foodID;
    private int count;
    private int userID;
    private int bsID;
    private int receiveID;
    private String finish_time;
    private int status;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getShopcarID() {
        return shopcarID;
    }

    public void setShopcarID(int shopcarID) {
        this.shopcarID = shopcarID;
    }

    public int getFoodID() {
        return foodID;
    }

    public void setFoodID(int foodID) {
        this.foodID = foodID;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getBsID() {
        return bsID;
    }

    public void setBsID(int bsID) {
        this.bsID = bsID;
    }

    public int getReceiveID() {
        return receiveID;
    }

    public void setReceiveID(int receiveID) {
        this.receiveID = receiveID;
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

    public Order(int id, int shopcarID, int foodID, int count, int userID, int bsID, int receiveID, String finish_time, int status) {
        this.id = id;
        this.shopcarID = shopcarID;
        this.foodID = foodID;
        this.count = count;
        this.userID = userID;
        this.bsID = bsID;
        this.receiveID = receiveID;
        this.finish_time = finish_time;
        this.status = status;
    }

    public Order() {
        super();
    }

    @Override
    public String toString() {
        return "Order{" +
                "id=" + id +
                ", shopcarID=" + shopcarID +
                ", foodID=" + foodID +
                ", count=" + count +
                ", userID=" + userID +
                ", bsID=" + bsID +
                ", receiveID=" + receiveID +
                ", finish_time='" + finish_time + '\'' +
                ", status=" + status +
                '}';
    }
}
