package com.sc.spaceCollection.reservation.model;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReservationDAO {
	int insertReservation(ReservationVO vo);
	ReservationVO selectReservationByDayAndNum(ReservationVO vo);
	Map<String, Object> showReservation(int reservationNum);
}
