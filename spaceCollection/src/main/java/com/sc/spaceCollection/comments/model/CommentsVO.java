package com.sc.spaceCollection.comments.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class CommentsVO {
	private int commentNum;
	private String commentContent;
	private Timestamp commentRegdate;
	private String commentDelFlag;
	private Timestamp commentOutdate;
	private int boardNum;
	private int userNum;
}
