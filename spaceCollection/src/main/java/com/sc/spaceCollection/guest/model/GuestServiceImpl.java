package com.sc.spaceCollection.guest.model;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class GuestServiceImpl implements GuestService {
	private final GuestDAO guestDao;

	@Override
	public int guestCheckId(String userId) {
		return guestDao.guestCheckId(userId);
	}

	@Override
	public int loginCheck(String userId, String userPwd) {
		String dbUserPwd=guestDao.selectPwd(userId);
		
		int result=0;
		if(dbUserPwd==null || dbUserPwd.isEmpty()) {
			result=GuestService.USERID_NONE;
		}else {
			if(dbUserPwd.equals(userPwd)) {
				result=GuestService.LOGIN_OK;
			}else {
				result=GuestService.PWD_DISAGREE;
			}
		}
		
		return result;
	}

	@Override
	public GuestVO selectUserInfo(String userId) {
		return guestDao.selectUserInfo(userId);
	}

	@Override
	public int insertGuest(GuestVO guestVo) {
		return guestDao.insertGuest(guestVo);
	}

	@Override
	public String selectUserSalt(String userId) {
		return guestDao.selectUserSalt(userId);
	}

}
