package com.sc.spaceCollection.collection.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CollectionDAO {
	List<Map<String, Object>> showCollectionList(int scNum);
	String selectCollectionName(int scNum);
}
