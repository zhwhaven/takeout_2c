package com.takeout.pojo;

import java.util.List;

public class Shopcar {
    private int id;
    private int foodID;
    private int count;
    private int userID;
    private int bsID;
    private List<Carson> carsonList;

    public Shopcar() {
        super();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public List<Carson> getCarsonList() {
        return carsonList;
    }

    public void setCarsonList(List<Carson> carsonList) {
        this.carsonList = carsonList;
    }

    public Shopcar(int id, int foodID, int count, int userID, int bsID, List<Carson> carsonList) {
        this.id = id;
        this.foodID = foodID;
        this.count = count;
        this.userID = userID;
        this.bsID = bsID;
        this.carsonList = carsonList;
    }

    @Override
    public String toString() {
        return "Shopcar{" +
                "id=" + id +
                ", foodID=" + foodID +
                ", count=" + count +
                ", userID=" + userID +
                ", bsID=" + bsID +
                ", carsonList=" + carsonList +
                '}';
    }
}
