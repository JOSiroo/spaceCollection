package com.sc.spaceCollection.comments.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CommentsDAO {
	int insertComments(CommentsVO vo);
	List<Map<String, Object>> selectByBoardNum(int boardNum);
	int countComments(int boardNum);
	List<Map<String, Object>> selecteventByBoardNum(int boardNum);
	int updateComments(CommentsVO vo);
	int updateCommentsDelFlag(int commentNum);
}
