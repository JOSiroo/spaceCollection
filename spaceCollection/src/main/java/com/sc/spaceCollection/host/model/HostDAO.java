package com.sc.spaceCollection.host.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface HostDAO {
	List<Map<String, Object>> selectSpaceCategory(int categoryNo);
	List<Map<String, Object>> selectSpaceType(int categoryNo);
}
