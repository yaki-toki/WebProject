package com.hyper.block.db.service;

import java.util.List;

import com.hyper.block.Group.GroupDBModel;
import com.hyper.block.db.MemberVO;

public interface MemberService {
    
    public List<MemberVO> selectMember() throws Exception;
    public void insertGroup(GroupDBModel dbmodel);
    // 등록된 이메일 조회
    public int selectGroupUserEmail(String userEmail);
}