package com.sc.spaceCollection.review.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.sc.spaceCollection.common.SearchVO;

@Mapper
public interface ReviewDAO {
	int insertReview(ReviewVO vo);
	List<Map<String,Object>> selectMyReview(String userId);
	List<Map<String, Object>> selectReviewEachUser(SearchVO vo);
}
