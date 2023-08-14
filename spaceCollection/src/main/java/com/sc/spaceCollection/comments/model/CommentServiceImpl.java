package com.sc.spaceCollection.comments.model;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CommentServiceImpl implements CommentsService{
	
	private final CommentsDAO commentsDao;
	
	@Override
	public int insertComments(CommentsVO vo) {
		return commentsDao.insertComments(vo);
	}

}
