package com.sc.spaceCollection.comments.model;

import java.util.List;
import java.util.Map;

public interface CommentsService {
	int insertComments(CommentsVO vo);
	List<Map<String, Object>> selectByBoardNum(int boardNum);
	int countComments(int boardNum);
}
