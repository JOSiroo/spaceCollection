package com.sc.spaceCollection.spaceFile.model;

import java.util.List;

public interface SpaceFileService {
	int insertSpaceFile(SpaceFileVO vo);
	List<SpaceFileVO> selectSpaceFileByBoardNum(int boardNum);
	int updateSpaceFileByImgNum(SpaceFileVO vo);
}
