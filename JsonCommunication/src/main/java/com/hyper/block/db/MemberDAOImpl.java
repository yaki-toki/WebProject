package com.hyper.block.db;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hyper.block.Group.GroupDBModel;

@Repository
public class MemberDAOImpl implements MemberDAO{
	
	@Autowired
	private SqlSession sqlSession = null;
	
	private static final String Namespace = "com.hyper.block.memberMapper";
	
	@Override
	public List<MemberVO> selectMember() throws Exception{
		return sqlSession.selectList(Namespace+".selectMember");
	}
	
	@Override
	public void insertGroup(GroupDBModel dbmodel) {
		sqlSession.insert(Namespace+".insertGroup", dbmodel);
	}
	
	@Override
	public int selectGroupUserEmail(String userEmail) {
		return sqlSession.selectOne(Namespace+".selectGroupUserEmail", userEmail );
	}
}
