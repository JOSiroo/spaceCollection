package com.sc.spaceCollection.userInfo.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.sc.spaceCollection.common.SearchVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserInfoServiceImpl implements UserInfoService{
	private final UserInfoDAO userInfoDao;

	@Override
	public List<UserInfoVO> selectMember(SearchVO vo) {
		return userInfoDao.selectMember(vo);
	}

	@Override
	public int getTotalRecord(SearchVO vo) {
		return userInfoDao.getTotalRecord(vo);
	}

	@Override
	public Map<String, Object> selectByUserNum(int userNum) {
		return userInfoDao.selectByUserNum(userNum);
	}
	
	
	
}
