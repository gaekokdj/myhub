package com.kiru.sesoc.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kiru.sesoc.util.PageNavigator;
import com.kiru.sesoc.vo.BoardVo;
import com.kiru.sesoc.vo.CommentsVo;
import com.kiru.sesoc.vo.LiketoVo;
import com.kiru.sesoc.vo.Mylist;

@Repository
public class BoardDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	// �? ?���?
	public int insertBoard(BoardVo boardVo){
		int result = 0;
		BoardMapper mapper=sqlSession.getMapper(BoardMapper.class);
		
		System.out.println(boardVo);
		
		result =mapper.insertBoard(boardVo);
		
		return result;
		
	}

	//�? 목록 �??��?���?
	public ArrayList<BoardVo> selectAllBoard(String searchWord, PageNavigator navi){
		ArrayList<BoardVo>boardList = new ArrayList<BoardVo>();
		
		BoardMapper mapper =sqlSession.getMapper(BoardMapper.class);
		
		RowBounds rb = new RowBounds(navi.getStartRecord(),navi.getCountPerPage());
	
		
		
		boardList = mapper.selectAllBoard(searchWord,rb);
		
		
		
		return boardList;
	}
	//?��?�� �? 보여주기 +조횟?�� 증�?
	public BoardVo selectBoard(String board_num){
		BoardVo result=null;
		
		BoardMapper mapper=sqlSession.getMapper(BoardMapper.class);
	
		mapper.board_hitCount(Integer.parseInt(board_num));
		
		result = mapper.selectBoard(board_num);
		
		return result;
	}
	
	//�? ?��?��
	public int deleteBoard(String board_num){
		int result = 0;
		BoardMapper mapper=sqlSession.getMapper(BoardMapper.class);
		
		result = mapper.deleteBoard(board_num);
		
		return result;
		
	}
	//�? ?��?��
	public int updateBoard(BoardVo boardVo){
		int result = 0;
		BoardMapper mapper=sqlSession.getMapper(BoardMapper.class);
		
		result = mapper.updateBoard(boardVo);
		
		return result;
		
	}
	//�??�� ?��?�� 찾기
	public int selectCount(String searchWord){
		int result = 0;
		
		BoardMapper mapper=sqlSession.getMapper(BoardMapper.class);
		
		result = mapper.selectCount(searchWord);
		
		return result;
		
	}
	//?���? ?���?
	public int insertComments(CommentsVo commentsVo){
		
		int result = 0;
		
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		
		result = mapper.insertComments(commentsVo);
		
		return result;
	}

	//�? ?���? �??��?���?
	public ArrayList<HashMap<String, String>> selectComments(String board_num){
		ArrayList<HashMap<String,String>>result=null;
		
		BoardMapper mapper =sqlSession.getMapper(BoardMapper.class);
		
		result= mapper.selectComments(board_num);
		
		return result;
	}

	//�? �??��?�� ?�� ?��?�� ?�� �??���?
	public int deleteComments(String board_num){
		int result=0;
		
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		
		result = mapper.deleteComments(board_num);
		
		return result;
	}
	//?���? ?��?�� �??���?
	public int deleteOneComments(String comment_num){
		int result=0;
		
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		
		result = mapper.deleteOneComments(comment_num);
		
		return result;
	}
	
	
	//좋아?�� 기능
	public int insert_like_check(LiketoVo LiketoVo){
		int result = 0;
		
		//System.out.println("insert_like_check LiketoVo = " + LiketoVo);
		
		BoardMapper mapper=sqlSession.getMapper(BoardMapper.class);
		
		result = mapper.insert_like_check(LiketoVo);
		
		mapper.like_count_plus(LiketoVo.getBoard_num());
		
		//System.out.println("insert_like_check result = " + result);
		
		
		
		
		return result;
		
		
	}
	
	//좋아?�� 취소 기능
	public int delete_like_check(LiketoVo LiketoVo){
		int result = 0;
		
		//System.out.println("delete_like_check LiketoVo = " + LiketoVo);
		
		BoardMapper mapper=sqlSession.getMapper(BoardMapper.class);
		
		result = mapper.delete_like_check(LiketoVo);
		
		mapper.like_count_minus(LiketoVo.getBoard_num());
		
		//System.out.println("delete_like_check result = " + result);
		
		return result;
		
	}
	
	//좋아?�� 찾아?���?
	public LiketoVo select_like_check(LiketoVo LiketoVo){
		LiketoVo result = null;
		
		//System.out.println("select_like_check LiketoVo = "+LiketoVo);
		
		BoardMapper mapper=sqlSession.getMapper(BoardMapper.class);
		
		result = mapper.select_like_check(LiketoVo);
		
		//System.out.println("select_like_check result = "+result);
		
		return result;
	}
	
	
	public ArrayList<Mylist> goboardList(String select_num) {
		BoardMapper mapper=sqlSession.getMapper(BoardMapper.class);
		
		return mapper.goboardList(select_num);
	}
		
}
