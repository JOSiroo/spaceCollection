package com.sc.spaceCollection.spaceDetail.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.sc.spaceCollection.refund.model.RefundVO;
import com.sc.spaceCollection.space.model.SpaceVO;

@Mapper
public interface SpaceDetailDAO {
	SpaceVO selectByNo(int spaceNo);
	List<Map<String, Object>> selectDetailByNo(int spaceNo);
	RefundVO selectRefund(int refundNo);
	SpaceDetailVO selectJustDetailByNo(int sdNum);
	List<SpaceDetailVO> selectBySpaceNo(int spaceNo);
	int countReservationBySdNum(int sdNum);

}
