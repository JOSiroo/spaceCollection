package com.sc.spaceCollection.reservation.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface ReservationDAO {
	int insertReservation(ReservationVO vo);
	ReservationVO selectReservationByDayAndNum(ReservationVO vo);
	Map<String, Object> showReservation(ReservationVO vo);
	List<Map<String,Object>> reservationList(String userId);
	int canceledReservation(String reservationUid);
	Map<String,Object> reservationReview(int reservationNum);
	int isReviewd(@Param("reservationNum") int reservationNum, @Param("userId")String userId);
}
