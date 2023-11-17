package com.service.spring.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
public class HistoryWithSnackName extends History{
	private String snackName;
	
	public HistoryWithSnackName() {
		
	}
	public HistoryWithSnackName(String snackName, Long historyId, String memberId, Long snackId, int count, String time) {
		super(historyId, memberId, snackId, count, time);
		this.snackName = snackName;
	}

	@Override
	public String toString() {
		return "HistoryWithSnackName{" +
				"snackName='" + snackName + '\'' +
				'}' + "super=" + super.toString();
	}
}
