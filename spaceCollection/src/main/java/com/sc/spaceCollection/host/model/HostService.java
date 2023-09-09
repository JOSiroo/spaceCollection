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
	//공간 등록
	List<SpaceCategoryAllVO> selectSpaceCategory();
	SpaceTypeVO selectSpaceTypeBySpaceTypeName(String spaceTypeName);
	int insertSpace(SpaceVO spaceVo, RefundVO refundVo);
	int insertSpaceTotalFacility(SpaceToTalFacilityVO spaceTotalFacilityVo);
	
	//세부공간 등록
	int insertSpaceDetail(SpaceDetailVO spaceDetailVo, FacilityVO facilityVo);
	
	//조회
	SpaceFileVO selectSpaceFile(int spaceNum);
	List<SpaceVO> selectSpaceByUserNum(int userNum);
	List<SpaceDetailVO> selectSpaceDetailBySpaceNum(int spaceNum);
	
	//공간 삭제
	int deleteSpace(int spaceNum);
	
	//공간 수정
	int updateSpace(SpaceVO spaceVo);
	int updateTotalFacility(SpaceToTalFacilityVO spaceTotalFacilityVo);
	int updateRefund(RefundVO refundVo);
	int deleteLicenseImg(String fileName);
	int deleteMainImg(String fileName);
	int deleteSubImg(String fileName);
	
	//세부공간 수정
	int updateSpaceDetail(SpaceDetailVO spaceDetailVo);
	int updateFacility(FacilityVO facilityVo);
	
	List<Map<String, Object>> selectHostReservation(int page, int size, int userNum,String status,String order,String keyword);
	List<Map<String, Object>> HostReservationCalendar(int userNum);
	UserInfoVO selectUserById (String userId);
	List<Integer> getDataByDate(String date, int userNum);
}
