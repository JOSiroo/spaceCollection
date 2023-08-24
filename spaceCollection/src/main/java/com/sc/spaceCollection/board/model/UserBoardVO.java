package com.sc.spaceCollection.board.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class UserBoardVO {
	private String boardDelFlag;
	private String boardTypeId;
	private String boardContent;
	private String boardTitle;

	private int commentNum;
	private String commentDelFlag;
	private String userId;
	private String commentContent;
	private Timestamp commentRegdate;
}
