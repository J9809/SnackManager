package com.service.spring.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class VoteWithSnackInfo extends Vote {

    private String snackName;
    private int count;

    public VoteWithSnackInfo(String memberId, String snackId, String snackName, int count) {
        super(memberId, snackId);
        this.snackName = snackName;
        this.count = count;
    }

    @Override
    public String toString() {
        return "VoteWithSnackName{" +
                "snackName='" + snackName + '\'' +
                '}' + " super=" + super.toString();
    }
}
