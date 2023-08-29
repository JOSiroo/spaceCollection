package com.sc.spaceCollection.guest.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface GuestDAO {
	int guestCheckId(String userId);
	String selectPwd(String userId);
	GuestVO selectUserInfo(String userId);
	int insertGuest(GuestVO guestVo);
	int selectCountEmail(String userEmail);
	String selectUserSalt(String userId);
	List<GuestVO> selectUserIdByEmail(String userEmail);
	
	//소셜 서비스 관련
	int selectKakaoUser(GuestVO guestVo);
	int insertKakaoUser(GuestVO guestVo);
	int checkedUserIdBySnsCode(String userId);
}
