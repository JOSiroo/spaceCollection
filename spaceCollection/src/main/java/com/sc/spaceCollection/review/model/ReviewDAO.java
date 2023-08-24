package com.sc.spaceCollection.review.model;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReviewDAO {
	int insertReview(ReviewVO vo);
}
