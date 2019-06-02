package com.hyper.block.db.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hyper.block.Group.GroupModel;
import com.hyper.block.db.MemberDAO;
import com.hyper.block.db.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
 
    @Inject 
    private MemberDAO dao;
    
    @Override
    public List<MemberVO> selectMember() throws Exception {
        return dao.selectMember();
    }
    
    @Override
    public void insertGroup(GroupModel model) {
    	dao.insertGroup(model);
    }
    
    @Override
    public int selectGroupUserEmail(String userEmail) {
    	return dao.selectGroupUserEmail(userEmail);
    }
    
}