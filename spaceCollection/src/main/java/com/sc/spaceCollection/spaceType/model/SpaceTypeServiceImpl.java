package com.sc.spaceCollection.spaceType.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.sc.spaceCollection.common.SearchVO;
import com.sc.spaceCollection.host.model.SpaceTypeVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SpaceTypeServiceImpl implements SpaceTypeService{
	
	private final SpaceTypeDAO spaceTypeDao;

	@Override
	public int getTotalRecord(SearchVO vo) {
		return spaceTypeDao.getTotalRecord(vo);
	}


	@Override
	public int insertSpaceType(SpaceTypeVO vo) {
		int result = 0;
		
		int cnt = spaceTypeDao.spaceTypeNameDubCheck(vo.getSpaceTypeName());
		
		if(cnt>0) {
			result = SpaceTypeService.DUB;
		}else {
			cnt = spaceTypeDao.insertSpaceType(vo);
			if(cnt>0) {
				result = SpaceTypeService.PASS;
			}else {
				result = SpaceTypeService.ERR;
			}
		}
		
		return result;
	}

	@Override
	@Transactional
	public int spaceTypeActivation(SpaceTypeListVO listVo) {
		int cnt = 0;
		try {
			for(SpaceTypeVO vo : listVo.getSpaceTypeItemList()) {
				if(vo.getSpaceTypeNo()>0) {
					cnt = spaceTypeDao.spaceTypeActivation(vo);
				}
			}
		}catch (RuntimeException e) {
			e.printStackTrace();
			cnt = -1;
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		
		return cnt;
	}

	@Override
	@Transactional
	public int spaceTypeDeactivation(SpaceTypeListVO listVo) {
		int cnt = 0;
		try {
			for(SpaceTypeVO vo : listVo.getSpaceTypeItemList()) {
				if(vo.getSpaceTypeNo()>0) {
					cnt = spaceTypeDao.spaceTypeDeactivation(vo);
				}
			}
		}catch (RuntimeException e) {
			e.printStackTrace();
			cnt = -1;
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		
		return cnt;
	}

	@Override
	public int updateSpaceType(SpaceTypeVO vo) {
		int result = 0;
		int cnt = 0;
		
		Map<String, Object> map = spaceTypeDao.selectBySpaceTypeName(vo.getSpaceTypeName());
		
		if(map == null || map.isEmpty()) {
			cnt = spaceTypeDao.insertSpaceType(vo);
			if(cnt>0) {
				result = SpaceTypeService.PASS;
			}else {
				result = SpaceTypeService.ERR;
			}
		}else {
			result = SpaceTypeService.DUB;
		}
		
		return result;
	}

	@Override
	public Map<String, Object> selectBySpaceTypeName(String spaceTypeName) {
		return spaceTypeDao.selectBySpaceTypeName(spaceTypeName);
	}


	@Override
	public List<Map<String, Object>> selectSpaceType(SearchVO vo) {
		return spaceTypeDao.selectSpaceType(vo);
	}

	
}
