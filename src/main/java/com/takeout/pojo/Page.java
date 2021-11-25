package com.takeout.pojo;

public class Page {
    private int id;
    private int bsid;
    private int receiveid;
    private String finishtime;
    private int status;
    private int userid;

    public Page() {
        super();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getBsid() {
        return bsid;
    }

    public void setBsid(int bsid) {
        this.bsid = bsid;
    }

    public int getReceiveid() {
        return receiveid;
    }

    public void setReceiveid(int receiveid) {
        this.receiveid = receiveid;
    }

    public String getFinishtime() {
        return finishtime;
    }

    public void setFinishtime(String finishtime) {
        this.finishtime = finishtime;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public Page(int id, int bsid, int receiveid, String finishtime, int status, int userid) {
        this.id = id;
        this.bsid = bsid;
        this.receiveid = receiveid;
        this.finishtime = finishtime;
        this.status = status;
        this.userid = userid;
    }

    @Override
    public String toString() {
        return "Page{" +
                "id=" + id +
                ", bsid=" + bsid +
                ", receiveid=" + receiveid +
                ", finishtime='" + finishtime + '\'' +
                ", status=" + status +
                ", userid=" + userid +
                '}';
    }
}
