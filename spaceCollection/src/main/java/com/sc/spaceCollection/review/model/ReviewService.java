package com.sc.spaceCollection.review.model;

import java.util.List;
import java.util.Map;

import com.sc.spaceCollection.common.SearchVO;

public interface ReviewService {
	int insertReview(ReviewVO vo);
	List<Map<String,Object>> selectMyReview(String userId, int size, int page);
	List<Map<String, Object>> selectReviewEachUser(SearchVO vo);
	int getTotalRecord(SearchVO vo);
	List<Map<String, Object>> selectNewReview();
	List<Map<String, Object>> spaceDetailReview(int spaceNum,int page);
	int deleteReview(int reviewNum);
	int getTotalRecordByUserId(String userId);
	Map<String, Object> getTotalRecordBySpaceNum(int spaceNum);
}
