package com.sc.spaceCollection.statics.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class StaticsServiceImpl implements StaticsService{
	private final StaticsDAO staticsDao;

	@Override
	public List<Map<String, Object>> lineStatic() {
		List<Map<String, Object>> list = staticsDao.lineStatic();
		
		for(Map<String, Object> map : list) {
			map.put("DAY", (map.get("DAY")+""))
		}
		

		
		return list;
	}

}
