package com.sc.spaceCollection.boardType.model;

import java.util.List;

public interface BoardTypeService {
	
	List<BoardTypeVO> selectBoardType();
	int createBoard(BoardTypeVO vo);
	BoardTypeVO selectByBoardTypeId(String boardTypeId);
	int updateBoardType(BoardTypeVO vo);
}
