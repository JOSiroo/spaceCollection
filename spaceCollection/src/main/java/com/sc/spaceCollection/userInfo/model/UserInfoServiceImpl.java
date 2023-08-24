package com.sc.spaceCollection.userInfo.model;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserInfoServiceImpl implements UserInfoService{

	private final UserInfoDAO userInfoDao;
}
