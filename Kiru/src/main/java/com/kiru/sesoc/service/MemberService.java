package com.kiru.sesoc.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kiru.sesoc.dao.MemberDAO;
import com.kiru.sesoc.vo.Usertable;

@Service
public class MemberService {
	
	@Autowired
	private MemberDAO dao;
	
	public boolean signup(Usertable vo) {
		String check = dao.checkId(vo.getUser_id());
		
		if(check == null) {
			int temp = dao.signup(vo);
			if(temp == 1) return true;
		}
		return false;
	}

	public void login(Usertable vo, HttpSession session) {
		Usertable temp = dao.login(vo);
		if ( temp != null ) session.setAttribute( "user_id", temp.getUser_id() );
		
	}
	
	public void Flogin(Usertable vo, HttpSession session) {
		String check = dao.checkId(vo.getUser_id());
		if(check == null){
			dao.signup(vo);
			session.setAttribute("user_id", vo.getUser_id());
		}
		if(check != null){
			Usertable temp = dao.login(vo);
			session.setAttribute("user_id", temp.getUser_id());
			
		}
	}

	public boolean insertBody(Usertable vo, HttpSession session) {
		String user_id = (String) session.getAttribute("user_id");
		vo.setUser_id(user_id);
		if(dao.insertBody(vo) != 1) return false;
		return true;
	}
}
