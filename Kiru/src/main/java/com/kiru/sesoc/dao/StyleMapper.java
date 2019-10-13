package com.kiru.sesoc.dao;

import java.util.ArrayList;

import com.kiru.sesoc.vo.Bottom;
import com.kiru.sesoc.vo.MyListvNum;
import com.kiru.sesoc.vo.Mylist;
import com.kiru.sesoc.vo.Outers;
import com.kiru.sesoc.vo.Recommeddress;
import com.kiru.sesoc.vo.Selected;
import com.kiru.sesoc.vo.Shoes;
import com.kiru.sesoc.vo.Top;
import com.kiru.sesoc.vo.Usertable;

public interface StyleMapper {

	public ArrayList<Recommeddress> selectGenre(Usertable vo);

	public Usertable bodyRead(Usertable vo);
	
	public ArrayList<Recommeddress> minimalStyle(Recommeddress vo);
	
	public ArrayList<Recommeddress> streetStyle(Recommeddress vo);

	public ArrayList<Recommeddress> classicStyle(Recommeddress vo);

	public ArrayList<Recommeddress> classicCasualStyle(Recommeddress vo);
	
	public ArrayList<Recommeddress> amecajiStyle(Recommeddress vo);
	
	public ArrayList<Recommeddress> workwearStyle(Recommeddress vo);

	public Outers viewOuter(int outer_num);

	public Top viewInner(int top_num);

	public Bottom viewPants(int bottom_num);

	public Shoes viewShoes(int shoes_num);

	public int addMyList(Selected vo);

	public ArrayList<Mylist> myList(Selected vo);
	
	public void styleDelete(String select_num);

	public ArrayList<Top> topBrandList(Top vo);

	public ArrayList<Bottom> bottomBrandList(Bottom vo);

	public ArrayList<Shoes> shoesBrandList(Shoes vo);

	public ArrayList<Outers> outerBrandList(Outers vo);

	public ArrayList<Outers> minimalOuterList(Outers outer);

	public ArrayList<Shoes> minimalShoesList(Shoes shoes);

	public ArrayList<Bottom> minimalBottomList(Bottom bottom);

	public ArrayList<Top> minimalTopList(Top top);

	public MyListvNum readMyListNum(String select_num);

	public ArrayList<Top> streetTopList(Top top);

	public ArrayList<Bottom> streetBottomList(Bottom bottom);

	public ArrayList<Shoes> streetShoesList(Shoes shoes);

	public ArrayList<Outers> streetOuterList(Outers outer);

	public ArrayList<Shoes> classicShoesList(Shoes shoes);

	public ArrayList<Outers> classicOuterList(Outers outer);

	public ArrayList<Top> classiccasualTopList(Top top);

	public ArrayList<Bottom> classiccasualBottomList(Bottom bottom);

	public ArrayList<Shoes> classiccasualShoesList(Shoes shoes);

	public ArrayList<Outers> classiccasualOuterList(Outers outer);

	public ArrayList<Top> amecajiTopList(Top top);

	public ArrayList<Bottom> amecajiBottomList(Bottom bottom);

	public ArrayList<Shoes> amecajiShoesList(Shoes shoes);

	public ArrayList<Outers> amecajiOuterList(Outers outer);

	public ArrayList<Top> workwearTopList(Top top);

	public ArrayList<Bottom> workwearBottomList(Bottom bottom);

	public ArrayList<Shoes> workwearShoesList(Shoes shoes);

	public ArrayList<Outers> workwearOuterList(Outers outer);
}
