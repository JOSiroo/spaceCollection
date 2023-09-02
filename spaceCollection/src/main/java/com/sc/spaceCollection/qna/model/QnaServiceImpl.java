package com.sc.spaceCollection.qna.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.sc.spaceCollection.common.SearchVO;

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

	@Override
	public List<Map<String, Object>> selectQnaByUserId(SearchVO searchVo) {
		return qnaDao.selectQnaByUserId(searchVo);
	}

	@Override
	public int totalQnaByUserId(SearchVO searchVo) {
		return qnaDao.totalQnaByUserId(searchVo);
	}

}
