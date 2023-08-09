package com.sc.spaceCollection.board.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BoardDAO {
	List<BoardVO> selectByBoardTypeId(String boardTypeName);
}
