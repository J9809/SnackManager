package com.service.spring.domain;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter
@ToString
public class Vote {
	
	private Long voteId;
	private String memberId;
	private Long snackId;
	
	public Vote() {}
	
	public Vote(String memberId, Long snackId) {
		super();
		this.memberId = memberId;
		this.snackId = snackId;
	}
	
	public Vote(Long voteId, String memberId, Long snackId) {
		super();
		this.voteId = voteId;
		this.memberId = memberId;
		this.snackId = snackId;
	}

}
