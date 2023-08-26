package com.sc.spaceCollection.review.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.sc.spaceCollection.common.SearchVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ReviewServiceImpl implements ReviewService{
	private final ReviewDAO reviewDao;
	
	@Override
	public int insertReview(ReviewVO vo) {
		return reviewDao.insertReview(vo);
	}

	@Override
	public List<Map<String, Object>> selectMyReview(String userId) {
		return reviewDao.selectMyReview(userId);
	}

	@Override
	public List<Map<String, Object>> selectReviewEachUser(SearchVO vo) {
		return reviewDao.selectReviewEachUser(vo);
	}
	
}
