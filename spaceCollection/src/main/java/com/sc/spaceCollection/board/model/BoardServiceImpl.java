package com.sc.spaceCollection.board.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.sc.spaceCollection.common.SearchVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService{
	private final BoardDAO boardDao;

	@Override
	public List<BoardVO> selectByBoardTypeId(String boardTypeName) {
		return boardDao.selectByBoardTypeId(boardTypeName);
	}

	@Override
	public List<Map<String, Object>> selectBoardAll(SearchVO searchVo) {
		return boardDao.selectBoardAll(searchVo);
	}

	@Override
	public int getTotalRecord(SearchVO searchVo) {
		return boardDao.getTotalRecord(searchVo);
	}

}
