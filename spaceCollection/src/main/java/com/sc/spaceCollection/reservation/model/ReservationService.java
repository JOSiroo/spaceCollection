package com.sc.spaceCollection.reservation.model;

import java.util.List;
import java.util.Map;

import com.sc.spaceCollection.common.SearchVO;

public interface ReservationService {
	int insertReservation(ReservationVO vo);
	Object selectReservationByDayAndNum(int sdNum, String reserveStartDay);
	Map<String, Object> showReservation(int reservationNum, String userId);
	List<Map<String,Object>> reservationList(String userId);
	public void refundPayment(String tid, int cancelAmount,int cancelTaxFreeAmount);
	int canceledReservation(String reservationUid);
	Map<String,Object> reservationReview(int reservationNum);
	boolean isReviewd(int reservationNum, String userId);
	List<Map<String, Object>> selectReservationAll(SearchVO vo);
}
