package com.service.spring.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter
@ToString
public class History {
	private Long historyId;
    private String memberId;
    private Long snackId;    
    private int count;
    private String time;
    
    public History() {}

	public History(Long historyId, String memberId, Long snackId, int count, String time) {
		super();
		this.historyId = historyId;
		this.memberId = memberId;
		this.snackId = snackId;
		this.count = count;
		this.time = time;
	}
	public History(String memberId, Long snackId, int count) {
		super();
		this.memberId = memberId;
		this.snackId = snackId;
		this.count = count;
	}
	
}
