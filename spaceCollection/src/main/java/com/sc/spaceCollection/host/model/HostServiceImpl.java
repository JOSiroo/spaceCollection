package com.sc.spaceCollection.host.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

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


}
