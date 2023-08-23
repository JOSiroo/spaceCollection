package com.sc.spaceCollection.host.model;

import java.util.List;
import java.util.Map;

public interface HostService {
	List<SpaceTypeVO> selectSpaceCategory();
	List<Map<String, Object>> selectSpaceType(String categoryName);
}
