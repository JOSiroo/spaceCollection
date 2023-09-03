package com.sc.spaceCollection.host.model;

import java.util.List;
import java.util.Map;

import com.sc.spaceCollection.userInfo.model.UserInfoVO;

public interface HostService {
	List<SpaceCategoryAllVO> selectSpaceCategory();
	SpaceTypeVO selectSpaceTypeBySpaceTypeName(String spaceTypeName);
	
	List<Map<String, Object>> selectHostReservation(int page, int size, int userNum,String status,String order,String keyword);
	List<Map<String, Object>> HostReservationCalendar(int userNum);
	UserInfoVO selectUserById (String userId);
	List<Integer> getDataByDate(String date, int userNum);
}
