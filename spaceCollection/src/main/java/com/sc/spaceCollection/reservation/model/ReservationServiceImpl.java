package com.sc.spaceCollection.reservation.model;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.sc.spaceCollection.spaceDetail.model.SpaceDetailDAO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ReservationServiceImpl implements ReservationService{
	private final static Logger logger = LoggerFactory.getLogger(ReservationServiceImpl.class);
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
	public Map<String, Object> showReservation(int reservationNum, String userId) {
		ReservationVO vo = new ReservationVO();
		vo.setReservationNum(reservationNum);
		vo.setUserId(userId);
		logger.info("vo = {}", vo);
		return reservationDao.showReservation(vo);
	}

	@Override
	public List<Map<String, Object>> reservationList(String userId) {
		return reservationDao.reservationList(userId);
	}
	
}
