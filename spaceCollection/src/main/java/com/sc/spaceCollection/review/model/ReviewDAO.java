package com.sc.spaceCollection.review.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReviewDAO {
	int insertReview(ReviewVO vo);
	List<Map<String,Object>> selectMyReview(String userId);
}
