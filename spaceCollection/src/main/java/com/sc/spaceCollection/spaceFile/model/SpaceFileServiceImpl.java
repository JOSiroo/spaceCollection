package com.sc.spaceCollection.spaceFile.model;

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
	
}
