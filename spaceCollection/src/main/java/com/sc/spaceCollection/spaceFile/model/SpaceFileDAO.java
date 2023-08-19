package com.sc.spaceCollection.spaceFile.model;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SpaceFileDAO {
	int insertSpaceFile(SpaceFileVO vo);
}
