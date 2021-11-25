package com.takeout.pojo;

public class Comment {
    private int c_id;
    private String c_word;
    private String c_picture;
    private int c_score;
    private String c_time;
    private int food_id;
    private int page_id;
    private User user;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Comment() {
        super();
    }


    public Comment(User user,int c_id, String c_word, String c_picture, int c_score, String c_time, int food_id, int page_id) {
        this.c_id = c_id;
        this.c_word = c_word;
        this.c_picture = c_picture;
        this.c_score = c_score;
        this.c_time = c_time;
        this.food_id = food_id;
        this.page_id = page_id;
        this.user=user;
    }


    @Override
    public String toString() {
        return "Comment{" +
                "c_id=" + c_id +
                ", c_word='" + c_word + '\'' +
                ", c_picture='" + c_picture + '\'' +
                ", c_score=" + c_score +
                ", c_time='" + c_time + '\'' +
                ", food_id=" + food_id +
                ", page_id=" + page_id +
                ", user=" + user +
                '}';
    }

    public int getC_id() {
        return c_id;
    }

    public void setC_id(int c_id) {
        this.c_id = c_id;
    }

    public String getC_word() {
        return c_word;
    }

    public void setC_word(String c_word) {
        this.c_word = c_word;
    }

    public String getC_picture() {
        return c_picture;
    }

    public void setC_picture(String c_picture) {
        this.c_picture = c_picture;
    }

    public int getC_score() {
        return c_score;
    }

    public void setC_score(int c_score) {
        this.c_score = c_score;
    }

    public String getC_time() {
        return c_time;
    }

    public void setC_time(String c_time) {
        this.c_time = c_time;
    }

    public int getFood_id() {
        return food_id;
    }

    public void setFood_id(int food_id) {
        this.food_id = food_id;
    }

    public int getPage_id() {
        return page_id;
    }

    public void setPage_id(int page_id) {
        this.page_id = page_id;
    }


}
