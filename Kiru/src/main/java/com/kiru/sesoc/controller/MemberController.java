package com.kiru.sesoc.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kiru.sesoc.service.MemberService;
import com.kiru.sesoc.vo.Usertable;



@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	@RequestMapping(value = "/signupForm", method = RequestMethod.GET)
	public String signupFrom() {
		return "/member/signupForm";
	}
	
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String signup(Usertable vo) {
		boolean result = service.signup(vo);
		if(result) return "redirect:/";
		return "redirect:/member/signupForm";
	}
	
	@RequestMapping(value = "/loginForm", method = RequestMethod.GET)
	public String loginForm() {
		return "/member/loginForm";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Usertable vo, HttpSession session) {
		service.login(vo, session);
		
		return "redirect:/";
	}
	
	@RequestMapping( value = "/Flogin", method = RequestMethod.POST )
	@ResponseBody
	public void Flogin( Usertable vo, HttpSession session ) {

		service.Flogin(vo, session);
		
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("user_id");
		return "redirect:/";
	}
	
	@RequestMapping(value = "/insertBody", method = RequestMethod.POST)
	public String insertBody(Usertable vo, HttpSession session) {
		service.insertBody(vo, session);
		return "redirect:/";
	}
}
