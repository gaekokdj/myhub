package com.kiru.sesoc.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kiru.sesoc.vo.Bottom;
import com.kiru.sesoc.vo.MyListvNum;
import com.kiru.sesoc.vo.Mylist;
import com.kiru.sesoc.vo.Outers;
import com.kiru.sesoc.vo.Recommeddress;
import com.kiru.sesoc.vo.Selected;
import com.kiru.sesoc.vo.Shoes;
import com.kiru.sesoc.vo.Top;
import com.kiru.sesoc.vo.Usertable;

@Repository
public class StyleDAO {
	
	@Autowired
	private SqlSession sqlSession;

	public ArrayList<Recommeddress> selectGenre(Usertable vo) {
		StyleMapper mapper = sqlSession.getMapper(StyleMapper.class);
		return mapper.selectGenre(vo);
	}

	public Usertable bodyRead(Usertable vo) {
		StyleMapper mapper = sqlSession.getMapper(StyleMapper.class);
		return mapper.bodyRead(vo);
	}
	
	public ArrayList<Recommeddress> minimalStyle(Recommeddress vo) {
		StyleMapper mapper = sqlSession.getMapper(StyleMapper.class);
		return mapper.minimalStyle(vo);
	}
	
	public ArrayList<Recommeddress> streetStyle(Recommeddress vo) {
		StyleMapper mapper = sqlSession.getMapper(StyleMapper.class);
		return mapper.streetStyle(vo);
	}

	public ArrayList<Recommeddress> classicStyle(Recommeddress vo) {
		StyleMapper mapper = sqlSession.getMapper(StyleMapper.class);
		return mapper.classicStyle(vo);
	}

	public ArrayList<Recommeddress> classicCasualStyle(Recommeddress vo) {
		StyleMapper mapper = sqlSession.getMapper(StyleMapper.class);
		return mapper.classicCasualStyle(vo);
	}
	
	public ArrayList<Recommeddress> amecajiStyle(Recommeddress vo) {
		StyleMapper mapper = sqlSession.getMapper(StyleMapper.class);
		return mapper.amecajiStyle(vo);
	}
	
	public ArrayList<Recommeddress> workwearStyle(Recommeddress vo) {
		StyleMapper mapper = sqlSession.getMapper(StyleMapper.class);
		return mapper.workwearStyle(vo);
	}

	public Outers viewOuter(int outer_num) {
		StyleMapper mapper = sqlSession.getMapper(StyleMapper.class);
		return mapper.viewOuter(outer_num);
	}

	public Top viewInner(int top_num) {
		StyleMapper mapper = sqlSession.getMapper(StyleMapper.class);
		return mapper.viewInner(top_num);
	}

	public Bottom viewPants(int bottom_num) {
		StyleMapper mapper = sqlSession.getMapper(StyleMapper.class);
		return mapper.viewPants(bottom_num);
	}

	public Shoes viewShoes(int shoes_num) {
		StyleMapper mapper = sqlSession.getMapper(StyleMapper.class);
		return mapper.viewShoes(shoes_num);
	}

	public int addMyList(Selected vo) {
		StyleMapper mapper = sqlSession.getMapper(StyleMapper.class);
		return mapper.addMyList(vo);
	}

	public ArrayList<Mylist> myList(Selected vo) {
		StyleMapper mapper = sqlSession.getMapper(StyleMapper.class);
		return mapper.myList(vo);
	}
	
	public void styleDelete(String select_num) {
		StyleMapper mapper = sqlSession.getMapper(StyleMapper.class);
		mapper.styleDelete(select_num);
	}

	public ArrayList<Top> topBrandList(Top vo) {
		StyleMapper mapper = sqlSession.getMapper(StyleMapper.class);
		return mapper.topBrandList(vo);
	}

	public ArrayList<Bottom> bottomBrandList(Bottom vo) {
		StyleMapper mapper = sqlSession.getMapper(StyleMapper.class);
		return mapper.bottomBrandList(vo);
	}

	public ArrayList<Shoes> shoesBrandList(Shoes vo) {
		StyleMapper mapper = sqlSession.getMapper(StyleMapper.class);
		return mapper.shoesBrandList(vo);
	}

	public ArrayList<Outers> outersBrandList(Outers vo) {
		StyleMapper mapper = sqlSession.getMapper(StyleMapper.class);
		return mapper.outerBrandList(vo);
	}

	public ArrayList<Outers> minimalOuterList(Outers outer) {
		StyleMapper mapper = sqlSession.getMapper(StyleMapper.class);
		return mapper.minimalOuterList(outer);
	}

	public ArrayList<Shoes> minimalShoesList(Shoes shoes) {
		StyleMapper mapper = sqlSession.getMapper(StyleMapper.class);
		return mapper.minimalShoesList(shoes);
		
	}

	public ArrayList<Bottom> minimalBottomList(Bottom bottom) {
		StyleMapper mapper = sqlSession.getMapper(StyleMapper.class);
		return mapper.minimalBottomList(bottom);
	}

	public ArrayList<Top> minimalTopList(Top top) {
		StyleMapper mapper = sqlSession.getMapper(StyleMapper.class);
		return mapper.minimalTopList(top);
	}
	
	public MyListvNum readMyListNum(String select_num) {
		StyleMapper mapper = sqlSession.getMapper(StyleMapper.class);
		return mapper.readMyListNum(select_num);
	}

	public ArrayList<Top> streetTopList(Top top) {
		StyleMapper mapper = sqlSession.getMapper(StyleMapper.class);
		return mapper.streetTopList(top);
	}

	public ArrayList<Bottom> streetBottomList(Bottom bottom) {
		StyleMapper mapper = sqlSession.getMapper(StyleMapper.class);
		return mapper.streetBottomList(bottom);
	}

	public ArrayList<Shoes> streetShoesList(Shoes shoes) {
		StyleMapper mapper = sqlSession.getMapper(StyleMapper.class);
		return mapper.streetShoesList(shoes);
	}

	public ArrayList<Outers> streetOuterList(Outers outer) {
		StyleMapper mapper = sqlSession.getMapper(StyleMapper.class);
		return mapper.streetOuterList(outer);
	}

	public ArrayList<Shoes> classicShoesList(Shoes shoes) {
		StyleMapper mapper = sqlSession.getMapper(StyleMapper.class);
		return mapper.classicShoesList(shoes);
	}

	public ArrayList<Outers> classicOuterList(Outers outer) {
		StyleMapper mapper = sqlSession.getMapper(StyleMapper.class);
		return mapper.classicOuterList(outer);
	}

	public ArrayList<Top> classiccasualTopList(Top top) {
		StyleMapper mapper = sqlSession.getMapper(StyleMapper.class);
		return mapper.classiccasualTopList(top);
	}

	public ArrayList<Bottom> classiccasualBottomList(Bottom bottom) {
		StyleMapper mapper = sqlSession.getMapper(StyleMapper.class);
		return mapper.classiccasualBottomList(bottom);
	}

	public ArrayList<Shoes> classiccasualShoesList(Shoes shoes) {
		StyleMapper mapper = sqlSession.getMapper(StyleMapper.class);
		return mapper.classiccasualShoesList(shoes);
	}

	public ArrayList<Outers> classiccasualOuterList(Outers outer) {
		StyleMapper mapper = sqlSession.getMapper(StyleMapper.class);
		return mapper.classiccasualOuterList(outer);
	}

	public ArrayList<Top> amecajiTopList(Top top) {
		StyleMapper mapper = sqlSession.getMapper(StyleMapper.class);
		return mapper.amecajiTopList(top);
	}

	public ArrayList<Bottom> amecajiBottomList(Bottom bottom) {
		StyleMapper mapper = sqlSession.getMapper(StyleMapper.class);
		return mapper.amecajiBottomList(bottom);
	}

	public ArrayList<Shoes> amecajiShoesList(Shoes shoes) {
		StyleMapper mapper = sqlSession.getMapper(StyleMapper.class);
		return mapper.amecajiShoesList(shoes);
	}

	public ArrayList<Outers> amecajiOuterList(Outers outer) {
		StyleMapper mapper = sqlSession.getMapper(StyleMapper.class);
		return mapper.amecajiOuterList(outer);
	}

	public ArrayList<Top> workwearTopList(Top top) {
		StyleMapper mapper = sqlSession.getMapper(StyleMapper.class);
		return mapper.workwearTopList(top);
	}

	public ArrayList<Bottom> workwearBottomList(Bottom bottom) {
		StyleMapper mapper = sqlSession.getMapper(StyleMapper.class);
		return mapper.workwearBottomList(bottom);
	}

	public ArrayList<Shoes> workwearShoesList(Shoes shoes) {
		StyleMapper mapper = sqlSession.getMapper(StyleMapper.class);
		return mapper.workwearShoesList(shoes);
	}

	public ArrayList<Outers> workwearOuterList(Outers outer) {
		StyleMapper mapper = sqlSession.getMapper(StyleMapper.class);
		return mapper.workwearOuterList(outer);
	}
	
}
