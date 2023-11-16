package com.service.spring.domain;

public class Member {
    private String memberId;
    private String password;
    private String name;    
    private String voteFlag;
    private String role;
	
    public Member() { }
    
    public Member(String memberId, String password, String name, String voteFlag, String role) {
		super();
		this.memberId = memberId;
		this.password = password;
		this.name = name;
		this.voteFlag = voteFlag;
		this.role = role;
	}
    
    public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getVoteFlag() {
		return voteFlag;
	}
	public void setVoteFlag(String voteFlag) {
		this.voteFlag = voteFlag;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	@Override
	public String toString() {
		return "Member [memberId=" + memberId + ", password=" + password + ", name=" + name + ", voteFlag=" + voteFlag
				+ ", role=" + role + "]";
	}
	
    
    
}