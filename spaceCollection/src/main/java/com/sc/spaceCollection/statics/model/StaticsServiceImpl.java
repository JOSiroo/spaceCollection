package com.sc.spaceCollection.statics.model;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class StaticsServiceImpl implements StaticsService{
	private static final Logger logger = LoggerFactory.getLogger(StaticsServiceImpl.class);
	
	private final StaticsDAO staticsDao;

	@Override
	public List<StaticsVO> lineStatic() {
		List<StaticsVO> list = staticsDao.lineStatic();
		logger.info("리스트 날짜 확인 = {}", list);
		
		return list;
	}

}
