package com.service.spring.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class VoteWithSnackInfo extends Vote {

    private String snackName;
    private Long snackId;
    private int count;
    private int price;

    public VoteWithSnackInfo() {
    }


    public VoteWithSnackInfo(String snackName, Long snackId, int count, int price) {
        this.snackName = snackName;
        this.snackId = snackId;
        this.count = count;
        this.price = price;
    }

    public String getSnackName() {
        return snackName;
    }

    public void setSnackName(String snackName) {
        this.snackName = snackName;
    }

    public Long getSnackId() {
        return snackId;
    }

    public void setSnackId(Long snackId) {
        this.snackId = snackId;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "VoteWithSnackInfo{" +
                "snackName='" + snackName + '\'' +
                ", snackId=" + snackId +
                ", count=" + count +
                ", price=" + price +
                '}';
    }
}