package com.sc.spaceCollection.collection.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface CollectionDAO {
	List<Map<String, Object>> showCollectionList(@Param("scCode")int scCode);
	String selectCollectionName(int scNum);
}
