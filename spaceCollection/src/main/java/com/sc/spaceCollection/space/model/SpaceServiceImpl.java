package com.sc.spaceCollection.space.model;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SpaceServiceImpl implements SpaceService{
	private final SpaceDAO spaceDao;
	
	@Override
	public SpaceVO selectByNo(int spaceNo) {
		return spaceDao.selectByNo(spaceNo);
	}

}
