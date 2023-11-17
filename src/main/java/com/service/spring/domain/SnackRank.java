package com.service.spring.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter
@ToString
public class SnackRank {
    private String name;
    private int rank;
    private int count;
}
