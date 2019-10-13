package com.kiru.sesoc.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kiru.sesoc.vo.Usertable;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int signup(Usertable vo) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.signup(vo);
	}
	
	public String checkId(String userid) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.checkId(userid);
	}

	public Usertable login(Usertable vo) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.login(vo);
	}

	public int insertBody(Usertable vo) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.insertBody(vo);
	}
}
