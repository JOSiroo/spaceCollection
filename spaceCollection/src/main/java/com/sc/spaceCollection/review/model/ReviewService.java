package com.sc.spaceCollection.review.model;

import java.util.List;
import java.util.Map;

public interface ReviewService {
	int insertReview(ReviewVO vo);
	List<Map<String,Object>> selectMyReview(String userId);
}
