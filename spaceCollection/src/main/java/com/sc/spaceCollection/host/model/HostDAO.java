package com.sc.spaceCollection.host.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface HostDAO {
	List<SpaceTypeVO> selectSpaceCategory();
	List<Map<String, Object>> selectSpaceType(String categoryName);
}
