package com.sc.spaceCollection.comments.model;

import java.util.List;
import java.util.Map;

public interface CommentsService {
   int insertComments(CommentsVO vo);
   int countComments(int boardNum); 
   List<Map<String, Object>> selecteventByBoardNum(int boardNum);
   List<Map<String, Object>> selectByBoardNum(CommentsVO commentsVo);
   int updateComments(CommentsVO vo);
   int updateCommentsDelFlag(int commentNum);
}
