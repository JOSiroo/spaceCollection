package com.sc.spaceCollection.qna.model;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class QnaServiceImpl implements QnaService {
	private final QnaDAO qnaDao;
	
	public int insertQna(QnaVO vo) {
		return qnaDao.insertQna(vo);
	}

}
