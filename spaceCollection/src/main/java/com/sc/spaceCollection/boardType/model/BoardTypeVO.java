package com.sc.spaceCollection.boardType.model;

import lombok.Data;

@Data
public class BoardTypeVO {
	private String boardTypeId; 
	private String boardTypeName; 
	private String boardTypeCommentOk;  
	private String boardTypeFileOk;  
	private int boardTypeFileNum;       
	private long boardTypeFileSize; 
	private int boardTypeUse;  
}
