package com.sc.spaceCollection.spaceFile.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SpaceFileServiceImpl implements SpaceFileService{
	private final SpaceFileDAO spaceFileDao;

	@Override
	public int insertSpaceFile(SpaceFileVO vo) {
		return spaceFileDao.insertSpaceFile(vo);
	}

	@Override
	public List<SpaceFileVO> selectSpaceFileByBoardNum(int boardNum) {
		return spaceFileDao.selectSpaceFileByBoardNum(boardNum);
	}

	@Override
	public int updateSpaceFileByImgNum(SpaceFileVO vo) {
		return spaceFileDao.updateSpaceFileByImgNum(vo);
	}
	
	
}
