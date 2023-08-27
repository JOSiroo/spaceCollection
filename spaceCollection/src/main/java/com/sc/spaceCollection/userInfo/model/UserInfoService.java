package com.sc.spaceCollection.userInfo.model;

import java.util.List;
import java.util.Map;

import com.sc.spaceCollection.common.SearchVO;

public interface UserInfoService {
	List<UserInfoVO> selectMember(SearchVO vo);
	int getTotalRecord(SearchVO vo);
	Map<String, Object> selectByUserNum(int userNum);
	int memberWithdrawal(String userId);
}
