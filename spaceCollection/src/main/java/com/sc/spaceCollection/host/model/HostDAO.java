package com.sc.spaceCollection.host.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.sc.spaceCollection.space.model.SpaceVO;
import com.sc.spaceCollection.userInfo.model.UserInfoVO;

@Mapper
public interface HostDAO {
	List<SpaceCategoryAllVO> selectSpaceCategory();
	SpaceTypeVO selectSpaceTypeBySpaceTypeName(String spaceTypeName);
	int insertSpace(SpaceVO spaceVo);
	
	List<Map<String, Object>> selectHostReservation(@Param("startRow") int startRow, @Param("endRow") int endRow,
													@Param("userNum")int userNum,@Param("status") String status,
													@Param("order")String order,@Param("keyword")String keyword);
	List<Map<String, Object>> HostReservationCalendar(@Param("userNum")int userNum);
	UserInfoVO selectUserById (String userId);
	List<Integer> getDataByDate(@Param("date") String date,@Param("userNum") int userNum);
}
