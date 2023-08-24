package com.sc.spaceCollection.userInfo.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sc.spaceCollection.common.SearchVO;

@Mapper
public interface UserInfoDAO {
	List<UserInfoVO> selectMember(SearchVO vo);
	int getTotalRecord(SearchVO vo);
}
