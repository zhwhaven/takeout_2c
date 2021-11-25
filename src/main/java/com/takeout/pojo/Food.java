package com.takeout.pojo;

public class Food {
    private int id;
    private String foodName;
    private double foodPrice;
    private double foodDiscount;
    private String foodPicture;
    private int foodCount;
    private long set_time;
    private String food_describe;
    private String food_style_code;
    public String getFood_describe() {
        return food_describe;
    }

    public void setFood_describe(String food_describe) {
        this.food_describe = food_describe;
    }

    public String getFood_style_code() {
        return food_style_code;
    }

    public void setFood_style_code(String food_style_code) {
        this.food_style_code = food_style_code;
    }



    public Food() {
        super();
    }

    public Food(int id, String foodName, double foodPrice, double foodDiscount, String foodPicture, int foodCount, long set_time, String food_describe, String food_style_code) {
        this.id = id;
        this.foodName = foodName;
        this.foodPrice = foodPrice;
        this.foodDiscount = foodDiscount;
        this.foodPicture = foodPicture;
        this.foodCount = foodCount;
        this.set_time = set_time;
        this.food_describe = food_describe;
        this.food_style_code = food_style_code;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFoodName() {
        return foodName;
    }

    public void setFoodName(String foodName) {
        this.foodName = foodName;
    }

    public double getFoodPrice() {
        return foodPrice;
    }

    public void setFoodPrice(double foodPrice) {
        this.foodPrice = foodPrice;
    }

    public double getFoodDiscount() {
        return foodDiscount;
    }

    public void setFoodDiscount(double foodDiscount) {
        this.foodDiscount = foodDiscount;
    }

    public String getFoodPicture() {
        return foodPicture;
    }

    public void setFoodPicture(String foodPicture) {
        this.foodPicture = foodPicture;
    }

    public int getFoodCount() {
        return foodCount;
    }

    public void setFoodCount(int foodCount) {
        this.foodCount = foodCount;
    }

    public long getSet_time() {
        return set_time;
    }

    public void setSet_time(long set_time) {
        this.set_time = set_time;
    }

    @Override
    public String toString() {
        return "Food{" +
                "id=" + id +
                ", foodName='" + foodName + '\'' +
                ", foodPrice=" + foodPrice +
                ", foodDiscount=" + foodDiscount +
                ", foodPicture='" + foodPicture + '\'' +
                ", foodCount=" + foodCount +
                ", set_time=" + set_time +
                ", food_describe='" + food_describe + '\'' +
                ", food_style_code='" + food_style_code + '\'' +
                '}';
    }
}
