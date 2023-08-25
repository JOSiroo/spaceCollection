package com.sc.spaceCollection.reservation.model;

import java.util.List;
import java.util.Map;

import com.sc.spaceCollection.common.PaginationInfo;
import com.sc.spaceCollection.common.SearchVO;

import lombok.Data;

@Data
public class ReservationAjaxVO {
	private PaginationInfo pagingInfo;
	private List<Map<String, Object>> reservationList;
	private SearchVO searchVo;
}
				 