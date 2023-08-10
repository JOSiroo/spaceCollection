package com.sc.spaceCollection.board.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.sc.spaceCollecion.common.SearchVO;

@Mapper
public interface BoardDAO {
	List<BoardVO> selectByBoardTypeId(String boardTypeName);
	List<Map<String, Object>> selectBoardAll(SearchVO searchVo);
	List<Map<String, Object>> selectBoardAll(String boardTypeName);
	int getTotalRecord(SearchVO searchVo);
}
