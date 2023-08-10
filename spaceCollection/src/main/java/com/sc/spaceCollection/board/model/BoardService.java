package com.sc.spaceCollection.board.model;

import java.util.List;
import java.util.Map;

import com.sc.spaceCollection.common.SearchVO;

public interface BoardService {
	List<BoardVO> selectByBoardTypeId(String boardTypeName);
	List<Map<String, Object>> selectBoardAll(SearchVO searchVo);
}
