package com.sc.spaceCollection.host.model;

import java.util.List;
import java.util.Map;

import lombok.Data;

@Data
public class SpaceTypeAllVO {
	private SpaceTypeVO spaceTypeVo;
	
	//view 정보 담을 list
	private List<Map<String, Object>> spaceTypeList;
}
