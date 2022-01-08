package com.takeout.pojo;

import java.io.Serializable;
import java.util.List;

public class User implements Serializable {
    private int id;
    private String userName;
    private String account;
    private String password;
    private String phoneNumber;
    private List<Food> foodList;
    private List<Receive> receiveList;

    public List<Food> getFoodList() {
        return foodList;
    }

    public void setFoodList(List<Food> foodList) {
        this.foodList = foodList;
    }

    public List<Receive> getReceiveList() {
        return receiveList;
    }

    public void setReceiveList(List<Receive> receiveList) {
        this.receiveList = receiveList;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public User() {
        super();
    }

    public User(int id, String userName, String account, String password, String phoneNumber, List<Food> foodList, List<Receive> receiveList) {
        this.id = id;
        this.userName = userName;
        this.account = account;
        this.password = password;
        this.phoneNumber = phoneNumber;
        this.foodList = foodList;
        this.receiveList = receiveList;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", userName='" + userName + '\'' +
                ", account='" + account + '\'' +
                ", password='" + password + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", foodList=" + foodList +
                ", receiveList=" + receiveList +
                '}';
    }
}
