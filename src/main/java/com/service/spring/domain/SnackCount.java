package com.service.spring.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SnackCount {

    private String snackId;
    private int count;

    public SnackCount() {
    }

    public SnackCount(String snackId, int count) {
        this.snackId = snackId;
        this.count = count;
    }
}
