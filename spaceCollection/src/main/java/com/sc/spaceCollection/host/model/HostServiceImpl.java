package com.sc.spaceCollection.host.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;


import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class HostServiceImpl implements HostService {
	private final HostDAO hostDao;

	@Override
	public List<Map<String, Object>> selectSpaceType(int categoryNo) {
		return hostDao.selectSpaceType(categoryNo);
	}

	@Override
	public List<Map<String, Object>> selectSpaceCategory() {
		return hostDao.selectSpaceCategory();
	}


	

}
