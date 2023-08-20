package com.sc.spaceCollection.space.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.sc.spaceCollection.common.SearchVO;

@Mapper
public interface SpaceDAO {
	List<Map<String, Object>> selectBySpaceType(@Param("startRow")int startRow,
												@Param("endRow") int endRow,
												@Param("spaceTypeNo") int spaceTypeNo,
												@Param("region") String region,
												@Param("maxPeople") int maxPeople,
												@Param("minPrice") int minPrice,
												@Param("maxPrice") int maxPrice,
												@Param("filterList") List<String> filterList,
												@Param("order") String order);
	
	List<Map<String, Object>> selectBySpaceName(@Param("startRow")int startRow,
												@Param("endRow") int endRow,
												@Param("spaceName") String spaceName,
												@Param("region") String region,
												@Param("maxPeople") int maxPeople,
												@Param("minPrice") int minPrice,
												@Param("maxPrice") int maxPrice,
												@Param("filterList") List<String> filterList,
												@Param("order") String order);
	List<SpaceVO> selectBySpaceTypeMap(int spaceTypeNo);
	List<SpaceVO> selectBySpaceNameMap(String spaceName);
	List<SpaceVO> selectBySpaceNum();
}
