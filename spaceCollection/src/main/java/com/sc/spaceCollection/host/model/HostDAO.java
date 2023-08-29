package com.sc.spaceCollection.host.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.sc.spaceCollection.userInfo.model.UserInfoVO;

@Mapper
public interface HostDAO {
	List<SpaceCategoryAllVO> selectSpaceCategory();
	List<Map<String, Object>> selectHostReservation(@Param("startRow") int startRow, @Param("endRow") int endRow, @Param("userNum")int userNum);
	List<Map<String, Object>> HostReservationCalendar(@Param("userNum")int userNum);
	UserInfoVO selectUserById (String userId);
}
