package com.kiru.sesoc.dao;

import com.kiru.sesoc.vo.Usertable;

public interface MemberMapper {
	
	public int signup(Usertable vo);
	
	public String checkId(String userid);

	public Usertable login(Usertable vo);

	public int insertBody(Usertable vo);
}
