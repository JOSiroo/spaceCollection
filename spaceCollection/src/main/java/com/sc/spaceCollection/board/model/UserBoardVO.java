package com.sc.spaceCollection.board.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class UserBoardVO {
	private String boardTitle;
	private String boardTypeId;
	private String boardContent;
	private String boardNum;
	private String boardDelFlag;

	private int commentNum;
	private String commentContent;
	private Timestamp commentRegdate;
	private String commentDelFlag;
	
	private String userId;
}
