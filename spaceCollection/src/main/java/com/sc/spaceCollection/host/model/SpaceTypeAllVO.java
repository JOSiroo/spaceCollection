package com.sc.spaceCollection.host.model;

import java.util.List;
import java.util.Map;

import lombok.Data;

@Data
public class SpaceTypeAllVO {
	private SpaceCategoryVO spaceCategoryVo;
	
	private List<Map<String, Object>> spaceTypeList;
}
