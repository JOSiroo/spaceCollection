package com.sc.spaceCollection.host.model;

import java.util.List;
import java.util.Map;

public interface HostService {
	List<Map<String, Object>> selectSpaceCategory();
	List<Map<String, Object>> selectSpaceType(int categoryNo);
}
