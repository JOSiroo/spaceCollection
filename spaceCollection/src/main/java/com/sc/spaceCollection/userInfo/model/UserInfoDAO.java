<<<<<<< HEAD
package com.sc.spaceCollection.userInfo.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.sc.spaceCollection.common.SearchVO;

@Mapper
public interface UserInfoDAO {
	List<UserInfoVO> selectMember(SearchVO vo);
	int getTotalRecord(SearchVO vo);
	Map<String, Object> selectByUserNum(int userNum);
}
=======
package com.sc.spaceCollection.userInfo.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sc.spaceCollection.common.SearchVO;

@Mapper
public interface UserInfoDAO {
	List<UserInfoVO> selectMember(SearchVO vo);
	int getTotalRecord(SearchVO vo);
}
>>>>>>> branch 'main' of https://github.com/JOSiroo/spaceCollection.git
