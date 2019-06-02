package com.hyper.block.db.service;

import java.util.List;

import com.hyper.block.Group.GroupModel;
import com.hyper.block.db.MemberVO;

public interface MemberService {
    
    public List<MemberVO> selectMember() throws Exception;
    public void insertGroup(GroupModel model);
    // 등록된 이메일 조회
    public int selectGroupUserEmail(String userEmail);
}