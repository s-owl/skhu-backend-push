package com.sowl_notice.dao;

import java.util.List;

import com.sowl_notice.model.MemberModel;

public interface MemberDao {
   MemberModel readUser(String user_id);
   int signIn(MemberModel memberModel);
   int checkMemberId(String member_id);
   int memberNoCheck(int member_no);
}