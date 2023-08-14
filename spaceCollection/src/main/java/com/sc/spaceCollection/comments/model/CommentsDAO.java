package com.sc.spaceCollection.comments.model;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CommentsDAO {
	int insertComments(CommentsVO vo);
}
