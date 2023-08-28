package com.sc.spaceCollection.host.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface HostService {
	List<SpaceTypeVO> selectSpaceType(int categoryNo);
	List<SpaceCategoryAllVO> selectSpaceCategory();
	List<Map<String, Object>> selectHostReservation(int userNum);
}
