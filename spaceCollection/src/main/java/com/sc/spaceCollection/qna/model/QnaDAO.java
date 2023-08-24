package com.sc.spaceCollection.qna.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface QnaDAO {
	int insertQna(QnaVO vo);
	List<Map<String, Object>> selectQnaBySpaceNum(int spaceNum);
	int deleteQna(int qnaNum);
}
