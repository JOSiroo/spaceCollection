package com.sc.spaceCollection.space.model;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.sc.spaceCollection.common.SearchVO;
import com.sc.spaceCollection.controller.UserMainController;
import com.sc.spaceCollection.spaceDetail.model.SpaceDetailVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SpaceServiceImpl implements SpaceService{
	private static final Logger logger = LoggerFactory.getLogger(UserMainController.class);
	private final SpaceDAO spaceDao;
	

	@Override
	public List<SpaceVO> selectBySpaceNum() {
		return spaceDao.selectBySpaceNum();
	}


	@Override
	public List<Map<String, Object>> selectBySpaceType(int page, int size, int spaceTypeNo,
														String region,int maxPeople,
														int minPrice, int maxPrice,
														List<String> filterList,
														String order) {
		int startRow = (page - 1) * size + 1;  
		int endRow = page * size;
		logger.info("typeNo page = {}, size = {}, startRow = {}, endRow = {}, order = {}", page,size,startRow,endRow,order);
		return spaceDao.selectBySpaceType(startRow, endRow, spaceTypeNo, region,maxPeople,minPrice,maxPrice,filterList,order);
	}


	@Override
	public List<Map<String, Object>> selectBySpaceName(int page, int size, String spaceName,
														String region,int maxPeople,
														int minPrice, int maxPrice,
														List<String> filterList,
														String order) {
		int startRow = (page - 1) * size + 1;  
		int endRow = page * size;
		logger.info("name page = {}, size = {}, startRow = {}, endRow = {}, order = {}", page,size,startRow,endRow,order);
		return spaceDao.selectBySpaceName(startRow, endRow, spaceName, region,maxPeople,minPrice,maxPrice,filterList,order);
	}


	@Override
	public List<SpaceVO> selectBySpaceTypeMap(int spaceTypeNo) {
		return spaceDao.selectBySpaceTypeMap(spaceTypeNo);
	}


	@Override
	public List<SpaceVO> selectBySpaceNameMap(String spaceName) {
		return spaceDao.selectBySpaceNameMap(spaceName);
	}
	

}
