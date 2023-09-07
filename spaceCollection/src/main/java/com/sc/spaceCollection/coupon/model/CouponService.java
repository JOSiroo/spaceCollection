package com.sc.spaceCollection.coupon.model;

import java.util.List;


public interface CouponService {
	
	int insertCoupon(CouponVO vo);
	int countCoupon(int userNum);
	List<CouponVO> selectUserCoupon(int userNum);
	
}
