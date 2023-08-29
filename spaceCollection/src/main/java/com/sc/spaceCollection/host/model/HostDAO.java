package com.sc.spaceCollection.host.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface HostDAO {
	List<SpaceTypeVO> selectSpaceType(int categoryNo);
	List<SpaceCategoryAllVO> selectSpaceCategory();
	List<Map<String, Object>> selectHostReservation(@Param("startRow") int startRow, @Param("endRow") int endRow,
													@Param("userNum")int userNum,@Param("status") String status,
													@Param("order")String order,@Param("keyword")String keyword);
	List<Map<String, Object>> HostReservationCalendar(@Param("userNum")int userNum);
	
}
