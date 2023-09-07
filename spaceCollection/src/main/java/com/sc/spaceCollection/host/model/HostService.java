package com.sc.spaceCollection.host.model;

import java.util.List;
import java.util.Map;

import com.sc.spaceCollection.facility.model.FacilityVO;
import com.sc.spaceCollection.facility.model.SpaceToTalFacilityVO;
import com.sc.spaceCollection.refund.model.RefundVO;
import com.sc.spaceCollection.space.model.SpaceVO;
import com.sc.spaceCollection.spaceDetail.model.SpaceDetailVO;
import com.sc.spaceCollection.spaceFile.model.SpaceFileVO;
import com.sc.spaceCollection.userInfo.model.UserInfoVO;

public interface HostService {
	List<SpaceCategoryAllVO> selectSpaceCategory();
	SpaceTypeVO selectSpaceTypeBySpaceTypeName(String spaceTypeName);
	int insertSpace(SpaceVO spaceVo, RefundVO refundVo);
	int insertSpaceTotalFacility(SpaceToTalFacilityVO spaceTotalFacilityVo);
	int insertSpaceDetail(SpaceDetailVO spaceDetailVo, FacilityVO facilityVo);
	SpaceFileVO selectSpaceFile(int spaceNum);
	List<SpaceVO> selectSpaceByUserNum(int userNum);
	
	List<Map<String, Object>> selectHostReservation(int page, int size, int userNum,String status,String order,String keyword);
	List<Map<String, Object>> HostReservationCalendar(int userNum);
	UserInfoVO selectUserById (String userId);
	List<Integer> getDataByDate(String date, int userNum);
}
