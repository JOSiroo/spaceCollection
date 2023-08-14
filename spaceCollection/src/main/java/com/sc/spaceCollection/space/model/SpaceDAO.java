package com.sc.spaceCollection.space.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SpaceDAO {
	List<SpaceVO> selectBySpaceType(String spaceType);
	List<SpaceVO> selectBySpaceName(String spaceName);
	List<SpaceVO> selectBySpaceNum();
}
