package com.kiru.sesoc.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kiru.sesoc.dao.BoardDAO;
import com.kiru.sesoc.util.PageNavigator;
import com.kiru.sesoc.vo.BoardVo;
import com.kiru.sesoc.vo.CommentsVo;
import com.kiru.sesoc.vo.LiketoVo;
import com.kiru.sesoc.vo.Mylist;

@Service
public class BoardService {
	
	@Autowired
	private BoardDAO dao;
	
	//�? ?���?
	public int insertBoard(BoardVo boardVo){
		return dao.insertBoard(boardVo);
	}
	//�? ?���? 목록 �??��?���? 
	public ArrayList<BoardVo> selectAllBoard(String searchWord, PageNavigator navi){
		return dao.selectAllBoard(searchWord, navi);
	}
	//�? ?���? �??��?���?
	public BoardVo selectBoard(String board_num){
		return dao.selectBoard(board_num);
	}
	//�? ?��?��
	public int deleteBoard(String board_num){
		
		dao.deleteComments(board_num);
		
		return dao.deleteBoard(board_num);
	}
	//�? ?��?��
	public int updateBoard(BoardVo boardVo){
		return dao.updateBoard(boardVo);		
	}
	//???��?�� 카운?�� �??��?���?
	public int selectCount(String searchWord){
		return dao.selectCount(searchWord);
	}
	//?���? ?��?��
	public int insertComments(CommentsVo commentsVo){
		return dao.insertComments(commentsVo);
	}
	//?���? �??��?���?
	public ArrayList<HashMap<String,String>> selectComments(String board_num){
		return dao.selectComments(board_num);
	}
	//?���?  ?���? ?��?��
	public int deleteOneComments(String comment_num){
		
		return dao.deleteOneComments(comment_num);
	}
	//like_check, like_check_cancel
	//좋아?��
	public int insert_like_check(LiketoVo LiketoVo){
		
		return dao.insert_like_check(LiketoVo);
	}
	//좋아?�� 취소
		public int delete_like_check(LiketoVo LiketoVo){
			
			return dao.delete_like_check(LiketoVo);
		}
	//좋아?�� 찾아?���?
		public LiketoVo select_like_check(LiketoVo LiketoVo){
			return dao.select_like_check(LiketoVo);
		}
		public ArrayList<Mylist> goboardList(String select_num) {
			return dao.goboardList(select_num);
		}
		
}
