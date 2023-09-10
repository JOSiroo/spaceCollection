package com.sc.spaceCollection.statics.model;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class StaticsServiceImpl implements StaticsService{
	private final StaticsDAO staticsDao;

	@Override
	public List<StaticsVO> lineStatic() {
		List<StaticsVO> list = staticsDao.lineStatic();
		
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//		for(StaticsVO vo : list) {
//			vo.setDay((vo.getDay()+"").substring(0, 10));
//		}
		
		return list;
	}

}
