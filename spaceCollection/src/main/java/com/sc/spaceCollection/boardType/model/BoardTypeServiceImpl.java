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
	
}
