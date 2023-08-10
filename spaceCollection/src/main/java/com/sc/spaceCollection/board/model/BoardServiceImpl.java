package com.sc.spaceCollection.board.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService{
	private final BoardDAO boardDao;

	@Override
	public List<BoardVO> selectByBoardTypeId(String boardTypeName) {
		return boardDao.selectByBoardTypeId(boardTypeName);
	}

}
