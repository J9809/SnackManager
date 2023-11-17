package com.service.spring.domain;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class HistoryWithSnackName extends History{
	private String snackName;
	
	public HistoryWithSnackName() {
		
	}
	public HistoryWithSnackName(String snackName) {
		super();
		this.snackName = snackName;
	}
	
}
