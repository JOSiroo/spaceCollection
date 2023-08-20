package com.sc.spaceCollection.space.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.sc.spaceCollection.common.SearchVO;
import com.sc.spaceCollection.spaceDetail.model.SpaceDetailVO;

public interface SpaceService {
	List<Map<String, Object>> selectBySpaceType(int page, int size, int spaceTypeNo,
												String region,int maxPeople,
												int minPrice, int MaxPrice,
												List<String> filterList,
												String order);
	
	List<Map<String, Object>> selectBySpaceName(int page, int size, String spaceName,
												String region,int maxPeople,
												int minPrice, int MaxPrice,
												List<String> filterList,
												String order);
	List<SpaceVO> selectBySpaceTypeMap(int spaceTypeNo);
	List<SpaceVO> selectBySpaceNameMap(String spaceName);
	List<SpaceVO> selectBySpaceNum();
}
