package com.takeout.pojo;

import java.util.List;

public class Business {
    private int id;
    private String bs_name;
    private String bs_phone;
    private String store_name;
    private String license_picture;
    private String idCard_picture;
    private String store_address;
//    0为审核中，-1为不被入驻，1为已入驻并营业，2为歇业状态
    private int status;
    private List<Food> foodList;
    private String bs_account;
    private String bs_password;
    private int start_time;
    private int over_time;
    private String store_picture;
    private String store_description;
    private int set_time;

    public String getStore_picture() {
        return store_picture;
    }

    public void setStore_picture(String store_picture) {
        this.store_picture = store_picture;
    }

    public String getStore_description() {
        return store_description;
    }

    public void setStore_description(String store_description) {
        this.store_description = store_description;
    }

    public int getStart_time() {
        return start_time;
    }

    public void setStart_time(int start_time) {
        this.start_time = start_time;
    }

    public int getOver_time() {
        return over_time;
    }

    public void setOver_time(int over_time) {
        this.over_time = over_time;
    }


    public String getBs_account() {
        return bs_account;
    }

    public void setBs_account(String bs_account) {
        this.bs_account = bs_account;
    }

    public String getBs_password() {
        return bs_password;
    }

    public void setBs_password(String bs_password) {
        this.bs_password = bs_password;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getBs_name() {
        return bs_name;
    }

    public void setBs_name(String bs_name) {
        this.bs_name = bs_name;
    }

    public String getBs_phone() {
        return bs_phone;
    }

    public void setBs_phone(String bs_phone) {
        this.bs_phone = bs_phone;
    }

    public String getStore_name() {
        return store_name;
    }

    public void setStore_name(String store_name) {
        this.store_name = store_name;
    }

    public String getLicense_picture() {
        return license_picture;
    }

    public void setLicense_picture(String license_picture) {
        this.license_picture = license_picture;
    }

    public String getIdCard_picture() {
        return idCard_picture;
    }

    public void setIdCard_picture(String idCard_picture) {
        this.idCard_picture = idCard_picture;
    }

    public String getStore_address() {
        return store_address;
    }

    public void setStore_address(String store_address) {
        this.store_address = store_address;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public List<Food> getFoodList() {
        return foodList;
    }

    public void setFoodList(List<Food> foodList) {
        this.foodList = foodList;
    }

    public Business() {
        super();
    }

    public int getSet_time() {
        return set_time;
    }

    public void setSet_time(int set_time) {
        this.set_time = set_time;
    }

    public Business(int id, String bs_name, String bs_phone, String store_name, String license_picture, String idCard_picture, String store_address, int status, List<Food> foodList, String bs_account, String bs_password, int start_time, int over_time, String store_picture, String store_description, int set_time) {
        this.id = id;
        this.bs_name = bs_name;
        this.bs_phone = bs_phone;
        this.store_name = store_name;
        this.license_picture = license_picture;
        this.idCard_picture = idCard_picture;
        this.store_address = store_address;
        this.status = status;
        this.foodList = foodList;
        this.bs_account = bs_account;
        this.bs_password = bs_password;
        this.start_time = start_time;
        this.over_time = over_time;
        this.store_picture = store_picture;
        this.store_description = store_description;
        this.set_time = set_time;
    }

    @Override
    public String toString() {
        return "Business{" +
                "id=" + id +
                ", bs_name='" + bs_name + '\'' +
                ", bs_phone='" + bs_phone + '\'' +
                ", store_name='" + store_name + '\'' +
                ", license_picture='" + license_picture + '\'' +
                ", idCard_picture='" + idCard_picture + '\'' +
                ", store_address='" + store_address + '\'' +
                ", status=" + status +
                ", foodList=" + foodList +
                ", bs_account='" + bs_account + '\'' +
                ", bs_password='" + bs_password + '\'' +
                ", start_time=" + start_time +
                ", over_time=" + over_time +
                ", store_picture='" + store_picture + '\'' +
                ", store_description='" + store_description + '\'' +
                ", set_time=" + set_time +
                '}';
    }
}
