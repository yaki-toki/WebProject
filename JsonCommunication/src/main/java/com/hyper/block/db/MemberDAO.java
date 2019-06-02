package com.hyper.block.db;

import java.util.List;

import com.hyper.block.Group.GroupModel;

public interface MemberDAO {
    
    public List<MemberVO> selectMember() throws Exception;
    
    public void insertGroup(GroupModel model);
}