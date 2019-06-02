package com.hyper.block.db;

import java.util.List;

import com.hyper.block.Group.GroupModel;

public interface MemberDAO {
    
    public List<MemberVO> selectMember() throws Exception;
    
    public void insertGroup(GroupModel model);
    
    // 등록된 이메일을 조회
    public int selectGroupUserEmail(String userEmail);
}