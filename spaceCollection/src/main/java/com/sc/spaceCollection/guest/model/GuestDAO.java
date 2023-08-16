package com.sc.spaceCollection.guest.model;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface GuestDAO {
	int guestCheckId(String userId);
	String selectPwd(String userId);
	GuestVO selectUserInfo(String userId);
	int insertGuest(GuestVO guestVo);
	int selectCountEmail(String userEmail);
}
