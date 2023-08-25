package com.sc.spaceCollection.host.model;

import java.util.List;
import java.util.Map;

public interface HostService {
	List<SpaceTypeVO> selectSpaceType(int categoryNo);
	List<SpaceCategoryAllVO> selectSpaceCategory();
}
