package com.sc.spaceCollection.userInfo.model;

import java.util.List;

import com.sc.spaceCollection.common.SearchVO;

public interface UserInfoService {
	List<UserInfoVO> selectMember(SearchVO vo);
	int getTotalRecord(SearchVO vo);
}
