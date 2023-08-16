package com.sc.spaceCollection.reservation.model;

import java.util.Map;

public interface ReservationService {
	int insertReservation(ReservationVO vo);
	Object selectReservationByDayAndNum(int sdNum, String reserveStartDay);
	Map<String, Object> showReservation(int reservationNum);
}
