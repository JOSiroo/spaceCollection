package com.sc.spaceCollection.boardType.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BoardTypeDAO {
	List<BoardTypeVO> selectBoardType();
}
