package com.sc.spaceCollection.comments.model;

import java.util.List;
import java.util.Map;

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

	@Override
	public List<Map<String, Object>> selectByBoardNum(int boardNum) {
		return commentsDao.selectByBoardNum(boardNum);
	}

	@Override
	public int countComments(int boardNum) {
		return commentsDao.countComments(boardNum);
	}

	@Override
	public List<Map<String, Object>> selecteventByBoardNum(int boardNum) {
		return commentsDao.selecteventByBoardNum(boardNum);
	}

}
