package com.sowl_notice.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.sowl_notice.dao.MemberDao;
import com.sowl_notice.model.MemberModel;

@Service
public class MemberService implements UserDetailsService{
	
	@Autowired
	MemberDao dao;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		MemberModel user = dao.readUser(username);
		if(user == null) {
			throw new UsernameNotFoundException(username);
		}
		return user;
	}
	
	public int signIn(MemberModel memberModel) {
		return dao.signIn(memberModel);
	}
	
	public int checkMemberId(String member_id) {
		return dao.checkMemberId(member_id);
	}
	
	public int memberNoCheck(int member_no)
	{
		return dao.memberNoCheck(member_no);
	}

}
