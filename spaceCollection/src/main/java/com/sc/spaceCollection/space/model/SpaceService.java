package com.sc.spaceCollection.space.model;

import java.util.List;

import com.sc.spaceCollection.spaceDetail.model.SpaceDetailVO;

public interface SpaceService {
	List<SpaceVO> selectBySpaceType(int spaceTypeNo);
	List<SpaceVO> selectBySpaceName(String spaceName);
	List<SpaceVO> selectBySpaceNum();
}
