package com.sc.spaceCollection.qna.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class QnaServiceImpl implements QnaService {
	private final QnaDAO qnaDao;
	
	public int insertQna(QnaVO vo) {
		return qnaDao.insertQna(vo);
	}

	@Override
	public List<Map<String, Object>> selectQnaBySpaceNum(int spaceNum) {
		return qnaDao.selectQnaBySpaceNum(spaceNum);
	}

	@Override
	public int deleteQna(int qnaNum) {
		return qnaDao.deleteQna(qnaNum);
	}

}
