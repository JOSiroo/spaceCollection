package com.sc.spaceCollection.qna.model;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface QnaDAO {
	int insertQna(QnaVO vo);
}
