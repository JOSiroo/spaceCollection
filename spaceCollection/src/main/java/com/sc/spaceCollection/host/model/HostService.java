package com.sc.spaceCollection.host.model;

import java.util.List;

public interface HostService {
	List<SpaceCategoryVO> selectSpaceCategory();
	List<SpaceTypeVO> selectSpaceByCategoryNo(int categoryNo);
}
