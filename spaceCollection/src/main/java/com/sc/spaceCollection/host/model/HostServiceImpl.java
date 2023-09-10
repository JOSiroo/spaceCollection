package com.sc.spaceCollection.host.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sc.spaceCollection.facility.model.FacilityVO;
import com.sc.spaceCollection.facility.model.SpaceToTalFacilityVO;
import com.sc.spaceCollection.refund.model.RefundVO;
import com.sc.spaceCollection.space.model.SpaceVO;
import com.sc.spaceCollection.spaceDetail.model.SpaceDetailVO;
import com.sc.spaceCollection.spaceFile.model.SpaceFileVO;
import com.sc.spaceCollection.userInfo.model.UserInfoVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class HostServiceImpl implements HostService {
	private final HostDAO hostDao;

	@Override
	public List<SpaceCategoryAllVO> selectSpaceCategory() {
		return hostDao.selectSpaceCategory();
	}
	
	@Override
	public SpaceTypeVO selectSpaceTypeBySpaceTypeName(String spaceTypeName) {
		return hostDao.selectSpaceTypeBySpaceTypeName(spaceTypeName);
	}

	@Override
	public List<Map<String, Object>> selectHostReservation(int page,int size, int userNum,String status,String order,String keyword) {
		//(0) 1 2 3 (4) / (5) 6 7 8 (9)
		int startRow = (page - 1) * size;
		int endRow = (page * size) - 1;
		
		return hostDao.selectHostReservation(startRow, endRow, userNum,status,order,keyword);
	}

	@Override
	public List<Map<String, Object>> HostReservationCalendar(int userNum) {
		return hostDao.HostReservationCalendar(userNum);
	}

	@Override
	public UserInfoVO selectUserById(String userId) {
		return hostDao.selectUserById(userId);
	}

	@Override
	public List<Integer> getDataByDate(String date, int userNum) {
		return hostDao.getDataByDate(date, userNum);
	}

	@Override
	@Transactional
	public int insertSpace(SpaceVO spaceVo, RefundVO refundVo) {
		int cnt = hostDao.insertRefund(refundVo);
		spaceVo.setRefundNum(refundVo.getRefundNum());
		cnt = hostDao.insertSpace(spaceVo);
		
		return cnt;
	}

	@Override
	public int insertSpaceTotalFacility(SpaceToTalFacilityVO spaceTotalFacilityVo) {
		return hostDao.insertSpaceTotalFacility(spaceTotalFacilityVo);
	}

	@Override
	@Transactional
	public int insertSpaceDetail(SpaceDetailVO spaceDetailVo, FacilityVO facilityVo) {
		if (facilityVo.getFacWifi() == null) {
			facilityVo.setFacWifi("");
		}
		if (facilityVo.getFacPrinter() == null) {
			facilityVo.setFacPrinter("");
		}
		if (facilityVo.getFacChairTable() == null) {
			facilityVo.setFacChairTable("");
		}
		if (facilityVo.getFacSmoke() == null) {
			facilityVo.setFacSmoke("");
		}
		if (facilityVo.getFacRestRoom() == null) {
			facilityVo.setFacRestRoom("");
		}
		if (facilityVo.getFacPC() == null) {
			facilityVo.setFacPC("");
		}
		if (facilityVo.getFacTV() == null) {
			facilityVo.setFacTV("");
		}
		if (facilityVo.getFacWhiteBoard() == null) {
			facilityVo.setFacWhiteBoard("");
		}
		if (facilityVo.getFacElevator() == null) {
			facilityVo.setFacElevator("");
		}
		if (facilityVo.getFacParking() == null) {
			facilityVo.setFacParking("");
		}
		if (facilityVo.getFacFood() == null) {
			facilityVo.setFacFood("");
		}
		if (facilityVo.getFacDrink() == null) {
			facilityVo.setFacDrink("");
		}
		if (facilityVo.getFacCook() == null) {
			facilityVo.setFacCook("");
		}
		if (facilityVo.getFacPet() == null) {
			facilityVo.setFacPet("");
		}
		if (facilityVo.getFacAudio() == null) {
			facilityVo.setFacAudio("");
		}
		
		int cnt = hostDao.insertFacility(facilityVo);
		spaceDetailVo.setFacilityNum(facilityVo.getFacilityNum());
		cnt = hostDao.insertSpaceDetail(spaceDetailVo);
		
		return cnt;
	}

	@Override
	public SpaceFileVO selectSpaceFile(int spaceNum) {
		return hostDao.selectSpaceFile(spaceNum);
	}

	@Override
	public List<SpaceVO> selectSpaceByUserNum(int userNum) {
		return hostDao.selectSpaceByUserNum(userNum);
	}

	@Override
	public int deleteSpace(int spaceNum) {
		return hostDao.deleteSpace(spaceNum);
	}

	@Override
	public int updateSpace(SpaceVO spaceVo) {
		return hostDao.updateSpace(spaceVo);
	}

	@Override
	public int updateTotalFacility(SpaceToTalFacilityVO spaceTotalFacilityVo) {
		return hostDao.updateTotalFacility(spaceTotalFacilityVo);
	}

	@Override
	public int updateRefund(RefundVO refundVO) {
		return hostDao.updateRefund(refundVO);
	}

	@Override
	public int deleteLicenseImg(String fileName) {
		return hostDao.deleteLicenseImg(fileName);
	}

	@Override
	public int deleteMainImg(String fileName) {
		return hostDao.deleteMainImg(fileName);
	}

	@Override
	public int deleteSubImg(String fileName) {
		return hostDao.deleteSubImg(fileName);
	}

	@Override
	public int updateSpaceDetail(SpaceDetailVO spaceDetailVo) {
		return hostDao.updateSpaceDetail(spaceDetailVo);
	}

	@Override
	public int updateFacility(FacilityVO facilityVo) {
		return hostDao.updateFacility(facilityVo);
	}

	@Override
	public List<SpaceDetailVO> selectSpaceDetailBySpaceNum(int spaceNum) {
		return hostDao.selectSpaceDetailBySpaceNum(spaceNum);
	}

	@Override
	public int deleteSpaceDetail(int sdNum) {
		return hostDao.deleteSpaceDetail(sdNum);
	}



}
