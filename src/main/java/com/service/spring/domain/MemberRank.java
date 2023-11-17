package com.service.spring.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter
@ToString
public class MemberRank {
    private String memberId;
    private int rank;
    private int count;
}
