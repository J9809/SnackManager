package com.service.spring.domain;

public class Vote {
	
	private Long voteId;
	private String memberId;
	private String snackId;
	
	public Vote() {}
	
	public Vote(String memberId, String snackId) {
		super();
		this.memberId = memberId;
		this.snackId = snackId;
	}
	
	public Vote(Long voteId, String memberId, String snackId) {
		super();
		this.voteId = voteId;
		this.memberId = memberId;
		this.snackId = snackId;
	}

	public Long getVoteId() {
		return voteId;
	}

	public void setVoteId(Long voteId) {
		this.voteId = voteId;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getSnackId() {
		return snackId;
	}

	public void setSnackId(String snackId) {
		this.snackId = snackId;
	}

	@Override
	public String toString() {
		return "Vote [voteId=" + voteId + ", memberId=" + memberId + ", snackId=" + snackId + "]";
	}

}
