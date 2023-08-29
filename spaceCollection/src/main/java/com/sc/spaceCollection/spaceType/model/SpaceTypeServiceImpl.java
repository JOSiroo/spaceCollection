package com.sc.spaceCollection.spaceType.model;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SpaceTypeServiceImpl implements SpaceTypeService{
	
	private final SpaceTypeDAO spaceTypeDao;
}
