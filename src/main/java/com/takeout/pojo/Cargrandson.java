package com.takeout.pojo;

public class Cargrandson {
    private Food food;
    private int count;
    private int shopcarId;
    private int orderId;



    public Cargrandson() {
        super();
    }

    public Food getFood() {
        return food;
    }

    public void setFood(Food food) {
        this.food = food;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public int getShopcarId() {
        return shopcarId;
    }

    public void setShopcarId(int shopcarId) {
        this.shopcarId = shopcarId;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public Cargrandson(Food food, int count, int shopcarId, int orderId) {
        this.food = food;
        this.count = count;
        this.shopcarId = shopcarId;
        this.orderId = orderId;
    }

    @Override
    public String toString() {
        return "Cargrandson{" +
                "food=" + food +
                ", count=" + count +
                ", shopcarId=" + shopcarId +
                ", orderId=" + orderId +
                '}';
    }
}
