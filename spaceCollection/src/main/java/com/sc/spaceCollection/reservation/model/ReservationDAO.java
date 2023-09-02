package com.sc.spaceCollection.reservation.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.sc.spaceCollection.common.SearchVO;

@Mapper
public interface ReservationDAO {
	int insertReservation(ReservationVO vo);
	List<ReservationVO> selectReservationByDayAndNum(ReservationVO vo);
	Map<String, Object> showReservation(ReservationVO vo);
	List<Map<String,Object>> reservationList(@Param("userId")String userId, @Param("startRow") int startRow, @Param("endRow") int endRow);
	int canceledReservation(String reservationUid);
	Map<String,Object> reservationReview(int reservationNum);
	int isReviewd(@Param("reservationNum") int reservationNum, @Param("userId")String userId);
	List<Map<String, Object>> selectReservationAll(SearchVO vo);
	int getTotalRecord(SearchVO vo);
	int countReservationList(String userId);
}
