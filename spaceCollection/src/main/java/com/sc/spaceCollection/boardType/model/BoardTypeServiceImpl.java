package com.sc.spaceCollection.boardType.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardTypeServiceImpl implements BoardTypeService{
	
	private final BoardTypeDAO boardTypeDao;

	@Override
	public List<BoardTypeVO> selectBoardType() {
		return boardTypeDao.selectBoardType();
	}

	@Override
	public int createBoard(BoardTypeVO vo) {
		int result = 0;
		int dupResult = boardTypeDao.boardTypeNameDupCheck(vo.getBoardTypeName());
		if(dupResult < 1) {
			result = boardTypeDao.insertBoardType(vo);
		}else {
			result = -1;
		}
		return result;
	}
	
}
