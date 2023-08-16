package com.sc.spaceCollection.host.model;

import java.util.List;

import org.springframework.stereotype.Service;


import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class HostServiceImpl implements HostService {
	private final HostDAO hostDao;

	@Override
	public List<SpaceCategoryVO> selectSpaceCategory() {
		return hostDao.selectSpaceCategory();
	}

	@Override
	public List<SpaceTypeVO> selectSpaceByCategoryNo(int categoryNo) {
		return hostDao.selectSpaceByCategoryNo(categoryNo);
	}

	
	

}
