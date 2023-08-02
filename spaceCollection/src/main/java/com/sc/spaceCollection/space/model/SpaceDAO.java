package com.sc.spaceCollection.space.model;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SpaceDAO {
	SpaceVO selectByNo(int spaceNo);

}
