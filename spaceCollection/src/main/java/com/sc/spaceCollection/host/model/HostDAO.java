package com.sc.spaceCollection.host.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface HostDAO {
	List<SpaceCategoryVO> selectSpaceCategory();
	List<SpaceTypeVO> selectSpaceByCategoryNo(int categoryNo);
}
