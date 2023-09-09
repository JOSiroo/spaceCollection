package com.sc.spaceCollection.collection.model;

import java.util.List;
import java.util.Map;

public interface CollectionService {
	List<Map<String, Object>> showCollectionList(int scCode);
	String selectCollectionName(int scNum);
}
