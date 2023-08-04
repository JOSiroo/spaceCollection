package com.sc.spaceCollection.admin.model;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AdminServiceImpl implements AdminService{
	private final AdminDAO adminDao;

	@Override
	public int loginCheck(String userid, String pwd) {
		String standPwd = adminDao.selectPwd(userid);
		
		int loginResult = 0;
		if(standPwd==null || standPwd.isEmpty()) {
			loginResult = AdminService.USERID_NONE;
		}else {
			if(pwd.equals(standPwd)) {
				loginResult = AdminService.LOGIN_OK;
			}else {
				loginResult = AdminService.PWD_DISAGREE;
			}
		}
		return loginResult;
	}

}
