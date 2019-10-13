package com.kiru.sesoc.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kiru.sesoc.service.StyleService;
import com.kiru.sesoc.vo.Bottom;
import com.kiru.sesoc.vo.Mylist;
import com.kiru.sesoc.vo.Outers;
import com.kiru.sesoc.vo.Recommeddress;
import com.kiru.sesoc.vo.Selected;
import com.kiru.sesoc.vo.Shoes;
import com.kiru.sesoc.vo.Top;
import com.kiru.sesoc.vo.Usertable;



@Controller
@RequestMapping("/styling")
public class StyleController {
	
	@Autowired
	private StyleService service;
	
	@RequestMapping(value = "/selectGenre", method = RequestMethod.GET)
	public String selectGenre(Usertable vo, HttpSession session, Model model) {
		ArrayList<Recommeddress> list = service.selectGenre(vo, session);
		Usertable user = service.bodyRead(vo, session);
		model.addAttribute("list", list);
		model.addAttribute("user", user);
		return "/styling/selectGenre";
	}
	
	@RequestMapping(value = "/minimalBrand", method = RequestMethod.POST)
	public String minimalBrand(Recommeddress vo, Model model, Top top, Bottom bottom, Shoes shoes, Outers outer) {
		ArrayList<Recommeddress> list = service.minimalStyle(vo);
		ArrayList<Top> topList = service.minimalTopList(top);
		ArrayList<Bottom> bottomList = service.minimalBottomList(bottom);
		ArrayList<Shoes> shoesList = service.minimalShoesList(shoes);
		ArrayList<Outers> outerList = service.minimalOuterList(outer);
		model.addAttribute("minimalList", list);
		model.addAttribute("topList", topList);
		model.addAttribute("bottomList", bottomList);
		model.addAttribute("shoesList", shoesList);
		model.addAttribute("outerList", outerList);
		return "/styling/minimalStyle";
	}
	
	@RequestMapping(value = "/streetBrand", method = RequestMethod.POST)
	public String streetBrand(Recommeddress vo, Model model) {
		ArrayList<Recommeddress> list = service.streetStyle(vo);
		model.addAttribute("streetList", list);
		return "/styling/streetStyle";
	}
	
	@RequestMapping(value = "/classicBrand", method = RequestMethod.POST)
	public String classicBrand(Recommeddress vo, Model model) {
		ArrayList<Recommeddress> list = service.classicStyle(vo);
		model.addAttribute("classicList", list);
		return "/styling/classicStyle";
	}
	
	@RequestMapping(value = "/classicCasualBrand", method = RequestMethod.POST)
	public String classicCasualBrand(Recommeddress vo, Model model) {
		ArrayList<Recommeddress> list = service.classicCasualStyle(vo);
		model.addAttribute("classicCasulList", list);
		return "/styling/classicCasualStyle";
	}
	
	@RequestMapping(value = "/amecajiBrand", method = RequestMethod.POST)
	public String amecajiBrand(Recommeddress vo, Model model) {
		ArrayList<Recommeddress> list = service.amecajiStyle(vo);
		model.addAttribute("amecajiList", list);
		return "/styling/amecajiStyle";
	}
	
	@RequestMapping(value = "/workwearBrand", method = RequestMethod.POST)
	public String workwearBrand(Recommeddress vo, Model model) {
		ArrayList<Recommeddress> list = service.workwearStyle(vo);
		model.addAttribute("workwearList", list);
		return "/styling/workwearStyle";
	}
	
	@RequestMapping(value = "viewminimal", method = RequestMethod.GET)
	@ResponseBody
	public ArrayList<String> viewminimal(int bottom_num, int top_num, int outer_num, int shoes_num) {
		Outers outer = service.viewOuter(outer_num);
		Top top = service.viewInner(top_num);
		Bottom bottom = service.viewPants(bottom_num);
		Shoes shoes = service.viewShoes(shoes_num);
		
		ArrayList<String> list = new ArrayList<>();
		list.add(0, top.getTop_photo_name());
		list.add(1, bottom.getBottom_photo_name());
		list.add(2, shoes.getShoes_photo_name());
		list.add(3, outer.getOuter_photo_name());
		return list;
	}
	
	@RequestMapping(value = "viewstreet", method = RequestMethod.GET)
	@ResponseBody
	public ArrayList<String> viewstreet(int bottom_num, int top_num, int outer_num, int shoes_num) {
		Outers outer = service.viewOuter(outer_num);
		Top top = service.viewInner(top_num);
		Bottom bottom = service.viewPants(bottom_num);
		Shoes shoes = service.viewShoes(shoes_num);
		
		ArrayList<String> list = new ArrayList<>();
		list.add(0, top.getTop_photo_name());
		list.add(1, bottom.getBottom_photo_name());
		list.add(2, shoes.getShoes_photo_name());
		list.add(3, outer.getOuter_photo_name());
		return list;
	}
	
	@RequestMapping(value = "viewclassic", method = RequestMethod.GET)
	@ResponseBody
	public ArrayList<String> viewclassic(int bottom_num, int top_num, int outer_num, int shoes_num) {
		Outers outer = service.viewOuter(outer_num);
		Shoes shoes = service.viewShoes(shoes_num);
		
		ArrayList<String> list = new ArrayList<>();
		list.add(0, outer.getOuter_photo_name());
		list.add(1, shoes.getShoes_photo_name());
		return list;
	}
	
	@RequestMapping(value = "viewclassiccasual", method = RequestMethod.GET)
	@ResponseBody
	public ArrayList<String> viewclassiccasual(int bottom_num, int top_num, int outer_num, int shoes_num) {
		Outers outer = service.viewOuter(outer_num);
		Top top = service.viewInner(top_num);
		Bottom bottom = service.viewPants(bottom_num);
		Shoes shoes = service.viewShoes(shoes_num);
		
		ArrayList<String> list = new ArrayList<>();
		list.add(0, top.getTop_photo_name());
		list.add(1, bottom.getBottom_photo_name());
		list.add(2, shoes.getShoes_photo_name());
		list.add(3, outer.getOuter_photo_name());
		return list;
	}
	
	@RequestMapping(value = "viewamecaji", method = RequestMethod.GET)
	@ResponseBody
	public ArrayList<String> viewamecaji(int bottom_num, int top_num, int outer_num, int shoes_num) {
		Outers outer = service.viewOuter(outer_num);
		Top top = service.viewInner(top_num);
		Bottom bottom = service.viewPants(bottom_num);
		Shoes shoes = service.viewShoes(shoes_num);
		
		ArrayList<String> list = new ArrayList<>();
		list.add(0, top.getTop_photo_name());
		list.add(1, bottom.getBottom_photo_name());
		list.add(2, shoes.getShoes_photo_name());
		list.add(3, outer.getOuter_photo_name());
		return list;
	}
	
	@RequestMapping(value = "viewworkwear", method = RequestMethod.GET)
	@ResponseBody
	public ArrayList<String> viewworkwear(int bottom_num, int top_num, int outer_num, int shoes_num) {
		Outers outer = service.viewOuter(outer_num);
		Top top = service.viewInner(top_num);
		Bottom bottom = service.viewPants(bottom_num);
		Shoes shoes = service.viewShoes(shoes_num);
		
		ArrayList<String> list = new ArrayList<>();
		list.add(0, top.getTop_photo_name());
		list.add(1, bottom.getBottom_photo_name());
		list.add(2, shoes.getShoes_photo_name());
		list.add(3, outer.getOuter_photo_name());
		return list;
	}
	
	@RequestMapping(value = "/addMyList", method = RequestMethod.POST)
	public String addMyList(Selected vo, HttpSession session, Model model) {
		boolean result = service.addMyList(vo, session);
		model.addAttribute("addResult", result);
		return "main";
	}
	
	@RequestMapping(value = "/myList", method = RequestMethod.GET)
	public String myList(Selected vo, HttpSession session, Model model) {
		ArrayList<Mylist> list = service.myList(vo, session);
		System.out.println("mylist = " + list);
		model.addAttribute("list", list);
		return "/styling/mylist";
	}
	
	@RequestMapping(value = "styleDelete", method = RequestMethod.GET)
	@ResponseBody
	public void styleDelete(String select_num) {
		service.styleDelete(select_num);
	}
	
	@RequestMapping(value = "minimalTopBrandList", method = RequestMethod.GET)
	@ResponseBody
	public ArrayList<Top> minimalTopBrandList(Top vo) {
		ArrayList<Top> list = service.topBrandList(vo);
		return list;
	}
	
	@RequestMapping(value = "minimalBottomBrandList", method = RequestMethod.GET)
	@ResponseBody
	public ArrayList<Bottom> minimalBottomBrandList(Bottom vo) {
		ArrayList<Bottom> list = service.bottomBrandList(vo);
		return list;
	}
	
	@RequestMapping(value = "minimalShoesBrandList", method = RequestMethod.GET)
	@ResponseBody
	public ArrayList<Shoes> minimalShoesBrandList(Shoes vo) {
		ArrayList<Shoes> list = service.shoesBrandList(vo);
		return list;
	}
	
	@RequestMapping(value = "minimalOuterBrandList", method = RequestMethod.GET)
	@ResponseBody
	public ArrayList<Outers> minimalOuterBrandList(Outers vo) {
		ArrayList<Outers> list = service.outerBrandList(vo);
		return list;
	}
	
	@RequestMapping(value = "streetTopBrandList", method = RequestMethod.GET)
	@ResponseBody
	public ArrayList<Top> streetTopBrandList(Top vo) {
		ArrayList<Top> list = service.topBrandList(vo);
		return list;
	}
	
	@RequestMapping(value = "streetBottomBrandList", method = RequestMethod.GET)
	@ResponseBody
	public ArrayList<Bottom> streetBottomBrandList(Bottom vo) {
		ArrayList<Bottom> list = service.bottomBrandList(vo);
		return list;
	}
	
	@RequestMapping(value = "streetShoesBrandList", method = RequestMethod.GET)
	@ResponseBody
	public ArrayList<Shoes> streetShoesBrandList(Shoes vo) {
		ArrayList<Shoes> list = service.shoesBrandList(vo);
		return list;
	}
	
	@RequestMapping(value = "streetOuterBrandList", method = RequestMethod.GET)
	@ResponseBody
	public ArrayList<Outers> streetOuterBrandList(Outers vo) {
		ArrayList<Outers> list = service.outerBrandList(vo);
		return list;
	}
	
	@RequestMapping(value = "classicShoesBrandList", method = RequestMethod.GET)
	@ResponseBody
	public ArrayList<Shoes> classicShoesBrandList(Shoes vo) {
		ArrayList<Shoes> list = service.shoesBrandList(vo);
		return list;
	}
	
	@RequestMapping(value = "classicOuterBrandList", method = RequestMethod.GET)
	@ResponseBody
	public ArrayList<Outers> classicOuterBrandList(Outers vo) {
		ArrayList<Outers> list = service.outerBrandList(vo);
		return list;
	}
	
	@RequestMapping(value = "classiccasualTopBrandList", method = RequestMethod.GET)
	@ResponseBody
	public ArrayList<Top> classiccasualTopBrandList(Top vo) {
		ArrayList<Top> list = service.topBrandList(vo);
		return list;
	}
	
	@RequestMapping(value = "classiccasualBottomBrandList", method = RequestMethod.GET)
	@ResponseBody
	public ArrayList<Bottom> classiccasualBottomBrandList(Bottom vo) {
		ArrayList<Bottom> list = service.bottomBrandList(vo);
		return list;
	}
	
	@RequestMapping(value = "classiccasualShoesBrandList", method = RequestMethod.GET)
	@ResponseBody
	public ArrayList<Shoes> classiccasualShoesBrandList(Shoes vo) {
		ArrayList<Shoes> list = service.shoesBrandList(vo);
		return list;
	}
	
	@RequestMapping(value = "classiccasualOuterBrandList", method = RequestMethod.GET)
	@ResponseBody
	public ArrayList<Outers> classiccasualOuterBrandList(Outers vo) {
		ArrayList<Outers> list = service.outerBrandList(vo);
		return list;
	}
	
	@RequestMapping(value = "amecajiTopBrandList", method = RequestMethod.GET)
	@ResponseBody
	public ArrayList<Top> amecajiTopBrandList(Top vo) {
		ArrayList<Top> list = service.topBrandList(vo);
		return list;
	}
	
	@RequestMapping(value = "amecajiBottomBrandList", method = RequestMethod.GET)
	@ResponseBody
	public ArrayList<Bottom> amecajiBottomBrandList(Bottom vo) {
		ArrayList<Bottom> list = service.bottomBrandList(vo);
		return list;
	}
	
	@RequestMapping(value = "amecajiShoesBrandList", method = RequestMethod.GET)
	@ResponseBody
	public ArrayList<Shoes> amecajiShoesBrandList(Shoes vo) {
		ArrayList<Shoes> list = service.shoesBrandList(vo);
		return list;
	}
	
	@RequestMapping(value = "amecajiOuterBrandList", method = RequestMethod.GET)
	@ResponseBody
	public ArrayList<Outers> amecajiOuterBrandList(Outers vo) {
		ArrayList<Outers> list = service.outerBrandList(vo);
		return list;
	}
	
	@RequestMapping(value = "workwearTopBrandList", method = RequestMethod.GET)
	@ResponseBody
	public ArrayList<Top> workwearTopBrandList(Top vo) {
		ArrayList<Top> list = service.topBrandList(vo);
		return list;
	}
	
	@RequestMapping(value = "workwearBottomBrandList", method = RequestMethod.GET)
	@ResponseBody
	public ArrayList<Bottom> workwearBottomBrandList(Bottom vo) {
		ArrayList<Bottom> list = service.bottomBrandList(vo);
		return list;
	}
	
	@RequestMapping(value = "workwearShoesBrandList", method = RequestMethod.GET)
	@ResponseBody
	public ArrayList<Shoes> workwearShoesBrandList(Shoes vo) {
		ArrayList<Shoes> list = service.shoesBrandList(vo);
		return list;
	}
	
	@RequestMapping(value = "workwearOuterBrandList", method = RequestMethod.GET)
	@ResponseBody
	public ArrayList<Outers> workwearOuterBrandList(Outers vo) {
		ArrayList<Outers> list = service.outerBrandList(vo);
		return list;
	}
}
