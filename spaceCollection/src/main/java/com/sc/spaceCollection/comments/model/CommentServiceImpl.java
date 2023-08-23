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
	public int updateComments(CommentsVO vo) {
		return commentsDao.updateComments(vo);
	}

	@Override
	public int updateCommentsDelFlag(int commentNum) {
		return commentsDao.updateCommentsDelFlag(commentNum);
	}

}
