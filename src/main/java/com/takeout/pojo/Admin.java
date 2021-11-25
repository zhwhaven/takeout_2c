package com.takeout.pojo;

public class Admin {
    private int id;
    private String admin_account;
    private String admin_password;

    public Admin() {
        super();
    }

    public Admin(int id, String admin_account, String admin_password) {
        this.id = id;
        this.admin_account = admin_account;
        this.admin_password = admin_password;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAdmin_account() {
        return admin_account;
    }

    public void setAdmin_account(String admin_account) {
        this.admin_account = admin_account;
    }

    public String getAdmin_password() {
        return admin_password;
    }

    public void setAdmin_password(String admin_password) {
        this.admin_password = admin_password;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "id=" + id +
                ", admin_account='" + admin_account + '\'' +
                ", admin_password='" + admin_password + '\'' +
                '}';
    }
}
