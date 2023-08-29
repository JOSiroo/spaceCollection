package com.sc.spaceCollection.spaceTypeCategory.model;

import java.util.List;

import com.sc.spaceCollection.common.SearchVO;

public interface SpaceTypeCategoryService {
	List<SpaceTypeCategoryVO> selectSpaceTypeCategory(SearchVO vo);
	int getTotalRecord(SearchVO vo);
	int insertSpaceTypeCategory(SpaceTypeCategoryVO vo);
}
