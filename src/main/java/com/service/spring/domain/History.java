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

	public Long getHistoryId() {
		return historyId;
	}

	public void setHistoryId(Long historyId) {
		this.historyId = historyId;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
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

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	@Override
	public String toString() {
		return "History{" +
				"historyId=" + historyId +
				", memberId='" + memberId + '\'' +
				", snackId=" + snackId +
				", count=" + count +
				", time='" + time + '\'' +
				'}';
	}
}
