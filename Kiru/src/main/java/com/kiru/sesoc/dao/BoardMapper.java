package com.kiru.sesoc.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;

import com.kiru.sesoc.vo.BoardVo;
import com.kiru.sesoc.vo.CommentsVo;
import com.kiru.sesoc.vo.LiketoVo;
import com.kiru.sesoc.vo.Mylist;

public interface BoardMapper {
	
	//�? ?���?
	public int insertBoard(BoardVo boardVo);
	//�? ?���? 목록 �??��?���?
	public ArrayList<BoardVo> selectAllBoard(String searchWord, RowBounds rb); //searchWord?�� ?��치하?�� ?���? �??��?���?
	//�? ?���? �????���?
	public BoardVo selectBoard(String board_num); 
	//�? ?��?��?���?
	public int deleteBoard(String board_num);
	//�? ?��?��
	public int updateBoard(BoardVo boardVo);
	//?��?���?
	public int selectCount(String searchWord);//searchWord?�� ?��치하?�� ?���? �??��?���?
	// ?��?��맵과 vo?��?�� �??��?��?�� 차이?�� vo?�� ?���? 빠트린게 ?��길수 ?���?�? ?��?��맵�? sql구문?�� �??��?��?�� 것이�? ?��문에 ?�� �??��?��
	//?���? ?��?��
	public int insertComments(CommentsVo commentsVo);
	//?���? 찾기
	public ArrayList<HashMap<String, String>> selectComments(String board_num);
	//?���? ?��?��
	public int deleteComments(String board_num);
	//?���? ?���? ?��?��
	public int deleteOneComments(String comment_num);
	//조횟?�� 증�?
	public void board_hitCount(int board_num);
	//like_check, like_check_cancel
	//좋아?�� 
	public int insert_like_check(LiketoVo LiketoVo);
	//좋아?�� 취소
	public int delete_like_check(LiketoVo LiketoVo);
	//좋아?�� 찾아?���?
	public LiketoVo select_like_check(LiketoVo LiketoVo);
	//좋아?�� 증�?
	public void like_count_plus(int board_num);
	//좋아?�� 감소
	public void like_count_minus(int board_num);
	
	public ArrayList<Mylist> goboardList(String select_num);
	
	
	
}
