package com.service.spring.domain;

public class HistoryWithName extends History {
	private String snackName;
	private String memberName;
	
	public HistoryWithName(String snackName, String memberName) {
		super();
		this.snackName = snackName;
		this.memberName = memberName;
	}

	public String getSnackName() {
		return snackName;
	}

	public void setSnackName(String snackName) {
		this.snackName = snackName;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	@Override
	public String toString() {
		return "HistoryWithName [snackName=" + snackName + ", memberName=" + memberName + "]";
	}
	
	
	
}
