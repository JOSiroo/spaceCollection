package com.sc.spaceCollection.reservation.model;

public interface ReservationService {
	int insertReservation(ReservationVO vo);
	Object selectReservationByDayAndNum(int sdNum, String reserveStartDay);
	ReservationVO showReservation(int reservationNum);
}
