package com.sc.spaceCollection.board.model;

import java.util.List;

public interface BoardService {
	List<BoardVO> selectByBoardTypeId(String boardTypeName);
}
