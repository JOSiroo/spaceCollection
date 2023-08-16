package com.sc.spaceCollection.reservation.model;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.sc.spaceCollection.spaceDetail.model.SpaceDetailDAO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ReservationServiceImpl implements ReservationService{
	private final ReservationDAO reservationDao;
	private final SpaceDetailDAO sdDao;

	@Override
	public int insertReservation(ReservationVO vo) {
		return reservationDao.insertReservation(vo);
	}

	@Override
	public Object selectReservationByDayAndNum(int sdNum, String reserveStartDay) {
		ReservationVO vo = new ReservationVO();
		vo.setSdNum(sdNum);
		vo.setReserveStartDay(reserveStartDay);
		vo = reservationDao.selectReservationByDayAndNum(vo);
		
		if(vo != null) {
			return vo;
		}else {
			return "noData";
		}
	}

	@Override
	public Map<String, Object> showReservation(int reservationNum) {
		return reservationDao.showReservation(reservationNum);
	}
	
}
