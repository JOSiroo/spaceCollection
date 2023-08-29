package com.sc.spaceCollection.spaceTypeCategory.model;

import java.util.List;

import org.springframework.stereotype.Service;

import com.sc.spaceCollection.common.SearchVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SpaceTypeCategoryServiceImpl implements SpaceTypeCategoryService{
	
	private final SpaceTypeCategoryDAO spaceTypeCategoryDao;
	
	@Override
	public List<SpaceTypeCategoryVO> selectSpaceTypeCategory(SearchVO vo) {
		return spaceTypeCategoryDao.selectSpaceTypeCategory(vo);
	}

	@Override
	public int getTotalRecord(SearchVO vo) {
		return spaceTypeCategoryDao.getTotalRecord(vo);
	}

	@Override
	public int insertSpaceTypeCategory(SpaceTypeCategoryVO vo) {
		return spaceTypeCategoryDao.insertSpaceTypeCategory(vo);
	}

}
