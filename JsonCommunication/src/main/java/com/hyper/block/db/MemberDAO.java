package com.hyper.block.db;

import java.util.List;

import com.hyper.block.Group.GroupDBModel;

public interface MemberDAO {
    
    public List<MemberVO> selectMember() throws Exception;
    
    public void insertGroup(GroupDBModel dbmodel);
    
    // 등록된 이메일을 조회
    public int selectGroupUserEmail(String userEmail);
}