package com.sc.spaceCollection.board.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.sc.spaceCollection.common.SearchVO;

@Mapper
public interface BoardDAO {
	List<BoardVO> selectByBoardTypeId(String boardTypeName);
	List<Map<String, Object>> selectBoardAll(SearchVO searchVo);
	int getTotalRecord(SearchVO searchVo);
	int insertBoard(BoardVO vo);
	BoardVO selectByBoardNum(int boardNum);
}