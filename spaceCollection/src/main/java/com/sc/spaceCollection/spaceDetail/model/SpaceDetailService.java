package com.sc.spaceCollection.spaceDetail.model;

import java.util.List;
import java.util.Map;

import com.sc.spaceCollection.space.model.SpaceVO;

public interface SpaceDetailService {
	Map<SpaceVO, List<Map<String, Object>>> selectDetailByNo(int spaceNo);
}
