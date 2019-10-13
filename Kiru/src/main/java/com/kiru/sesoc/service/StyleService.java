package com.kiru.sesoc.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kiru.sesoc.dao.StyleDAO;
import com.kiru.sesoc.vo.Bottom;
import com.kiru.sesoc.vo.MyListvNum;
import com.kiru.sesoc.vo.Mylist;
import com.kiru.sesoc.vo.Outers;
import com.kiru.sesoc.vo.Recommeddress;
import com.kiru.sesoc.vo.Selected;
import com.kiru.sesoc.vo.Shoes;
import com.kiru.sesoc.vo.Top;
import com.kiru.sesoc.vo.Usertable;

@Service
public class StyleService {
	
	@Autowired
	private StyleDAO dao;

	public ArrayList<Recommeddress> selectGenre(Usertable vo, HttpSession session) {
		String user_id = (String) session.getAttribute("user_id");
		vo.setUser_id(user_id);
		return dao.selectGenre(vo);
	}

	public Usertable bodyRead(Usertable vo, HttpSession session) {
		String user_id = (String) session.getAttribute("user_id");
		vo.setUser_id(user_id);
		return dao.bodyRead(vo);
	}
	
	public ArrayList<Recommeddress> minimalStyle(Recommeddress vo) {
		return dao.minimalStyle(vo);
	}
	
	public ArrayList<Recommeddress> streetStyle(Recommeddress vo) {
		return dao.streetStyle(vo);
	}

	public ArrayList<Recommeddress> classicStyle(Recommeddress vo) {
		return dao.classicStyle(vo);
	}

	public ArrayList<Recommeddress> classicCasualStyle(Recommeddress vo) {
		return dao.classicCasualStyle(vo);
	}
	
	public ArrayList<Recommeddress> amecajiStyle(Recommeddress vo) {
		return dao.amecajiStyle(vo);
	}
	
	public ArrayList<Recommeddress> workwearStyle(Recommeddress vo) {
		return dao.workwearStyle(vo);
	}

	public Outers viewOuter(int outer_num) {
		return dao.viewOuter(outer_num);
	}

	public Top viewInner(int top_num) {
		return dao.viewInner(top_num);
	}

	public Bottom viewPants(int bottom_num) {
		return dao.viewPants(bottom_num);
	}

	public Shoes viewShoes(int shoes_num) {
		return dao.viewShoes(shoes_num);
	}

	public boolean addMyList(Selected vo, HttpSession session) {
		String user_id = (String) session.getAttribute("user_id");
		vo.setUser_id(user_id);
		if(dao.addMyList(vo) != 1) return false;
		return true;
	}

	public ArrayList<Mylist> myList(Selected vo, HttpSession session) {
		String user_id = (String) session.getAttribute("user_id");
		vo.setUser_id(user_id);
		return dao.myList(vo);
	}
	
	public void styleDelete(String select_num) {
		dao.styleDelete(select_num);
	}

	public ArrayList<Top> topBrandList(Top vo) {
		return dao.topBrandList(vo);
	}

	public ArrayList<Bottom> bottomBrandList(Bottom vo) {
		return dao.bottomBrandList(vo);
	}

	public ArrayList<Shoes> shoesBrandList(Shoes vo) {
		return dao.shoesBrandList(vo);
	}

	public ArrayList<Outers> outerBrandList(Outers vo) {
		return dao.outersBrandList(vo);
	}

	public ArrayList<Outers> minimalOuterList(Outers outer) {
		return dao.minimalOuterList(outer);
	}

	public ArrayList<Shoes> minimalShoesList(Shoes shoes) {
		return dao.minimalShoesList(shoes);
	}

	public ArrayList<Bottom> minimalBottomList(Bottom bottom) {
		return dao.minimalBottomList(bottom);
	}

	public ArrayList<Top> minimalTopList(Top top) {
		return dao.minimalTopList(top);
	}

	public MyListvNum readMyListNum(String select_num) {
		return dao.readMyListNum(select_num);
	}

	
	//------------------------------------------------------------
	public Mylist readMyListPhotoName(MyListvNum mnvo) {

		Mylist mlist = new Mylist();
		
		mlist.setOuter_photo_name( dao.viewOuter( mnvo.getOuter_num() ).getOuter_photo_name() );
		mlist.setTop_photo_name( dao.viewInner( mnvo.getTop_num() ).getTop_photo_name() );
		mlist.setBottom_photo_name( dao.viewPants( mnvo.getBottom_num() ).getBottom_photo_name() );
		mlist.setShoes_photo_name( dao.viewShoes( mnvo.getShoes_num() ).getShoes_photo_name() );
		
		return mlist;
	}
}
