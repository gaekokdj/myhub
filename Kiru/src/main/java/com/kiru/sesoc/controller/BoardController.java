package com.kiru.sesoc.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kiru.sesoc.dao.BoardDAO;
import com.kiru.sesoc.service.BoardService;
import com.kiru.sesoc.service.StyleService;
import com.kiru.sesoc.util.PageNavigator;
import com.kiru.sesoc.vo.BoardVo;
import com.kiru.sesoc.vo.CommentsVo;
import com.kiru.sesoc.vo.LiketoVo;
import com.kiru.sesoc.vo.MyListvNum;
import com.kiru.sesoc.vo.Mylist;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	
	@Autowired
	private BoardService service;
	@Autowired
	private StyleService stservice;
	@Autowired
	BoardDAO dao;
	final static int COUNTPERPAGE=5;
	final static int PAGEPERGROUP=3;
	
	//게식판 페이지 이동
	@RequestMapping(value="boardList", method=RequestMethod.GET)
	public String boardList( Model model,@RequestParam(value="page",defaultValue="1")int page, String searchWord ){
		
		//ArrayList<BoardVo> boardList = service.selectAllBoard(null);
		
		PageNavigator navi = new PageNavigator(COUNTPERPAGE, PAGEPERGROUP, page,service.selectCount(searchWord));
		
		service.selectAllBoard(searchWord, navi);
		
		model.addAttribute("boardList", service.selectAllBoard(searchWord, navi));
		model.addAttribute("navi",navi);
		model.addAttribute("searchWord", searchWord);
		
		return "/board/boardList";
	}
	
	//글쓰기 페이지 이동
			@RequestMapping(value="goboardWrite", method=RequestMethod.GET)
			public String goboardWrite(){
				return "/board/boardwriteForm";
			}
	
	
	
	//글쓰기 페이지 이동
		@RequestMapping(value="goboardList", method=RequestMethod.POST)
		public String goboardList(String select_num, Model model){
			//ArrayList<Mylist> list = service.goboardList(select_num);
			ArrayList<Mylist> list = service.goboardList(select_num);
			System.out.println(list);
			Mylist t = list.get(0);
			//model.addAttribute("list", list);
			model.addAttribute("list", t);
			System.out.println(t);
			//return "/board/boardwrite";
			return "/board/boardRead2_temp";
		}
		
		@RequestMapping(value="goboardList2", method=RequestMethod.POST)
		public String goboardList2(String select_num, Model model){
			
			MyListvNum mnvo = stservice.readMyListNum(select_num);
			
			Mylist mlist = stservice.readMyListPhotoName(mnvo);
			
			model.addAttribute("mnvo", mnvo);
			model.addAttribute("list", mlist);
			
			return "/board/boardRead2_temp2";
		}
	
	
	//게시글 작성
	@RequestMapping(value="boardwrite", method=RequestMethod.POST)
	public String boardwrite(BoardVo boardVo, Model model, HttpSession session){
		
		System.out.println("boardVo = " + boardVo);
		
		if(session.getAttribute("user_id")==null){
			
			return "testapi";
		}else{
		String id=(String) session.getAttribute("user_id");
		boardVo.setUser_id(id);
		System.out.println("aaaaaaaaaaa");
		service.insertBoard(boardVo);
		}
			return "redirect:boardList";
}
	//개시글 상세 보기
	@RequestMapping(value="boardDetail", method=RequestMethod.GET)
	public String boardDetail(String board_num, Model model, HttpSession session ){
		LiketoVo LiketoVo = new LiketoVo(); 
		String id=(String) session.getAttribute("user_id");
		LiketoVo.setUser_id(id);
		LiketoVo.setBoard_num(Integer.parseInt(board_num));
		
		BoardVo vo = service.selectBoard(board_num);
		model.addAttribute("board", vo );
		model.addAttribute("commentsVo", service.selectComments(board_num));
		model.addAttribute("LiketoVo",service.select_like_check(LiketoVo));
		
		//System.out.println(board_num);
		return "/board/boardDetail";
	}
	
	//개시글 상세 보기
		@RequestMapping(value="boardDetail2", method=RequestMethod.GET)
		public String boardDetail2(String board_num, Model model, HttpSession session ){
			LiketoVo LiketoVo = new LiketoVo(); 
			String id=(String) session.getAttribute("user_id");
			LiketoVo.setUser_id(id);
			LiketoVo.setBoard_num(Integer.parseInt(board_num));
			
			BoardVo vo = service.selectBoard(board_num);
			model.addAttribute("board", vo);
			model.addAttribute("commentsVo", service.selectComments(board_num));
			model.addAttribute("LiketoVo",service.select_like_check(LiketoVo));
			//System.out.println(board_num);
			
			MyListvNum mnvo = new MyListvNum();
			mnvo.setOuter_num( Integer.parseInt( vo.getOuter_num() ) );
			mnvo.setTop_num( Integer.parseInt( vo.getTop_num() ) );
			mnvo.setBottom_num( Integer.parseInt( vo.getBottom_num() ) );
			mnvo.setShoes_num( Integer.parseInt( vo.getShoes_num() ) );
			
			if( mnvo.getOuter_num() != 0 ) {
				Mylist mlist = stservice.readMyListPhotoName(mnvo);
				System.out.println("mlist = " + mlist);
				
				model.addAttribute("list",mlist);
			}
			
			
			//return "/board/boardDetail";
			return "/board/boardRead2_temp";
		}
	
	//게시글 삭제
	@RequestMapping(value="deleteBoard", method=RequestMethod.POST)
	public String deleteBoard(String board_num, HttpSession session){
			
		if(session.getAttribute("user_id")==null){
			return "redirect:/testapi";
		}else{
			String loginId=(String) session.getAttribute("user_id");
			String user_id = service.selectBoard(board_num).getUser_id();
			if(loginId.equals(user_id)){
					service.deleteBoard(board_num);
			}else{
			 return "redirect:boardList";
			}
		}
		
		 return "redirect:boardList";
	}
	//수정 페이지로 가기
	@RequestMapping(value="goUpdateBoard", method=RequestMethod.GET)
	public String goUpdateBoard(String board_num, Model model ){
		
		model.addAttribute("board", service.selectBoard(board_num));
		
		return "/board/boardwriteForm";
	}
	
	//게시글 수정
		@RequestMapping(value="updateBoard", method=RequestMethod.POST)
		public String updateBoard(BoardVo boardVo, HttpSession session){
				
			if(session.getAttribute("user_id")==null){
				return "testapi";
			}else{
				String loginId=(String) session.getAttribute("user_id");
				String user_id = service.selectBoard(Integer.toString(boardVo.getBoard_num())).getUser_id();
				if(loginId.equals(user_id)){
					service.updateBoard(boardVo);
				}else{
				 return "redirect:boardList";
				}
			}
			
			 return "redirect:boardList";
		}
	
	//댓글 입력
		@RequestMapping(value="insertComments", method=RequestMethod.POST)
		public String insertComments(CommentsVo commentsVo, HttpSession session){
			System.out.println(commentsVo);
			if(session.getAttribute("user_id")==null){
				return "testapi";
			}else{
				String user_id=(String)session.getAttribute("user_id");
				commentsVo.setUser_id(user_id);
				service.insertComments(commentsVo);
				
				return "redirect:/board/boardDetail2?board_num="+commentsVo.getBoard_num();
			}
			
		}
	
		//댓글 한개 삭제
		@RequestMapping(value="deleteOneComments", method=RequestMethod.POST)
		public String deleteOneComments(int board_num, String comment_num){
			
			service.deleteOneComments(comment_num);
			
			return "redirect:/board/boardDetail?board_num="+board_num;
		}
		
		
		//좋아요
		@RequestMapping(value="insert_like_check", method=RequestMethod.POST)
		public String insert_like_check(LiketoVo LiketoVo, HttpSession session){
			
			String id=(String) session.getAttribute("user_id");
			LiketoVo.setUser_id(id);
			
			service.insert_like_check(LiketoVo);
			
			return "redirect:/board/boardDetail?board_num="+LiketoVo.getBoard_num();
		}
		
		//좋아요 취소
		@RequestMapping(value="delete_like_check", method=RequestMethod.POST)
		public String delete_like_check(LiketoVo LiketoVo, HttpSession session){
			
			String id=(String) session.getAttribute("user_id");
			LiketoVo.setUser_id(id);
			
			service.delete_like_check(LiketoVo);
			
			return "redirect:/board/boardDetail?board_num="+LiketoVo.getBoard_num();
		}
		

}
