package com.sc.spaceCollection.zzim.model;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface ZzimDAO {
	ZzimVO selectZzimBySpaceNum(@Param("spaceNum") int spaceNum, @Param("userNum") int userNum);
	int selectZzim(int spaceNum, int userNum);
	int insertZzim(ZzimVO vo);
	int deleteZzim(ZzimVO vo);
}
