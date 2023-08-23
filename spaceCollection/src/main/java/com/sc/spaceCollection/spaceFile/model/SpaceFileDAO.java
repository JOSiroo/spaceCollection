package com.sc.spaceCollection.spaceFile.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SpaceFileDAO {
	int insertSpaceFile(SpaceFileVO vo);
	List<SpaceFileVO> selectSpaceFileByBoardNum(int boardNum);
	int updateSpaceFileByImgNum(SpaceFileVO vo);
}
