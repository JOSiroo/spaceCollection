package com.sc.spaceCollection.space.model;

import java.util.List;

import org.springframework.stereotype.Service;

import com.sc.spaceCollection.spaceDetail.model.SpaceDetailVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SpaceServiceImpl implements SpaceService{
	private final SpaceDAO spaceDao;
	
	@Override
	public List<SpaceVO> selectBySpaceType(String spaceType) {
		return spaceDao.selectBySpaceType(spaceType);
	}

	@Override
	public List<SpaceVO> selectBySpaceName(String spaceName) {
		return spaceDao.selectBySpaceName(spaceName);
	}

	@Override
	public List<SpaceVO> selectBySpaceNum() {
		return spaceDao.selectBySpaceNum();
	}
	

}
